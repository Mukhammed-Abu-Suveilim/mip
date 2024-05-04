# создание объекта Simulator
set ns [new Simulator]

# открытие на запись файла out.nam для визуализатора nam
set nf [open out.nam w]

# все результаты моделирования будут записаны в переменную nf
$ns namtrace-all $nf

# открытие на запись файла out.tr для регистрации событий
set tf [open out.tr w]
$ns trace-all $tf

#максимальный размер TCP-окна 32; размер передаваемого пакета 500 байт;
Agent/TCP set window_ 32
Agent/TCP set pktSize_ 500


# маршрутизаторы
set node_(r1) [$ns node]
set node_(r2) [$ns node]

# Узлы сети:
set N 20
for {set i 0} {$i < $N} {incr i} {
	set node_(s$i) [$ns node]
	$ns duplex-link $node_(s$i) $node_(r1) 100Mb 20ms DropTail

	set node_(n$i) [$ns node]
	$ns duplex-link $node_(n$i) $node_(r2) 100Mb 20ms DropTail

	set tcp_($i) [$ns create-connection TCP/Reno $node_(s$i) TCPSink $node_(n$i) $i]
	set ftp_($i) [$tcp_($i) attach-source FTP]
}

set windowVsTime1A [open Window1A w]

for {set i 0} {$i < $N} {incr i} {
	$ns at 0.0 "$ftp_($i) start"
	if {$i == 1} {
		set windowVsTime2B [open Window2B w] 	
	}
	set qmon [$ns monitor-queue $node_(s$i) $node_(r1) [open qm_($i).out w] 0.1];
	[$ns link $node_(s$i) $node_(r1)] queue-sample-timeout;
	$ns at 0.0 "plotWindow $tcp_($i) $windowVsTime1A"	
}
$ns at 0.0 "plotWindow $tcp_(1) $windowVsTime2B"


# между маршрутизаторами установлено симплексное соединение (R1–R2) с про-
# пускной способностью 20 Мбит/с и задержкой 15 мс очередью типа RED,
# размером буфера 300 пакетов; в обратную сторону — симплексное соедине-
# ние (R2–R1) с пропускной способностью 15 Мбит/с и задержкой 20 мс очередью
# типа DropTail;
$ns simplex-link $node_(r1) $node_(r2) 20Mb 15ms RED
$ns queue-limit $node_(r1) $node_(r2) 300
$ns simplex-link $node_(r2) $node_(r1) 15Mb 20ms DropTail

# Параметры алгоритма RED: q min = 75, q max = 150, q w = 0, 002, p max = 0.1;
set red [[$ns link $node_(r1) $node_(r2)] queue]
$red set thresh_ 75
$red set maxthresh_ 150
$red set q_weight_ 0.002
$red set linterm_ 10


# Формирование файла с данными о размере окна TCP:
proc plotWindow {tcpSource file} {
	global ns
	set time 0.01
	set now [$ns now]
	set cwnd [$tcpSource set cwnd_]
	puts $file "$now $cwnd"
	$ns at [expr $now+$time] "plotWindow $tcpSource $file"
}
# Здесь cwnd_ — текущее значение окна перегрузки.

# Мониторинг очереди:
set tchan_ [open all.q w]
$red trace curq_
$red trace ave_
$red attach $tchan_


# Процедура finish:
proc finish {} {
	global ns nf tf tchan_ N
	$ns flush-trace
	close $nf
	# подключение кода AWK:
	set awkCode {
	{
		if ($1 == "Q" && NF>2) {
			print $2, $3 >> "CurrentQueue";
			set end $2
	}
		else if ($1 == "a" && NF>2)
		print $2, $3 >> "AvrageQueue";
	}
	}

	if { [info exists tchan_] } {
		close $tchan_
	}


	exec rm -f Current-Queue Avrage-Queue
	exec touch Avrage-Queue Current-Queue
	exec awk $awkCode all.q
	puts $tf \"queue
	exec cat Current-Queue >@ $tf
	puts $tf \n\"ave-queue"
	exec cat Avrage-Queue >@ $tf
	close $tf


	# Запуск xgraph с графиками окна TCP и очереди:
	exec xgraph -bb -tk -x time -t CWND "windowVsTime2B" Window2B &
	exec xgraph -bb -tk -x time -t CWND "windowVsTime1A" Window1A &
	exec xgraph -bb -tk -x time -y "CurrentQueue" CurrentQueue &
	exec xgraph -bb -tk -x time -y "AvrageQueue" AvrageQueue &
	exec nam out.nam &
	exit 0
}

$ns at 20 "finish"
$ns run