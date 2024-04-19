# создание объекта Simulator
set ns [new Simulator]

$ns rtproto DV
# открытие на запись файла out.nam для визуализатора nam
set nf [open out.nam w]
# все результаты моделирования будут записаны в переменную nf
$ns namtrace-all $nf

# открытие на запись файла трассировки out.tr
# для регистрации всех событий
set f [open out.tr w]
# все регистрируемые события будут записаны в переменную f
$ns trace-all $f

# процедура finish закрывает файлы трассировки
# и запускает визуализатор nam
proc finish {} {
	global ns f nf 
	$ns flush-trace 
	close $f 
	close $nf
	exec nam out.nam &
	exit 0
}

# создать узлы
set N 6
for {set i 0} {$i < $N} {incr i} {
	set n($i) [$ns node]
}

# соединим узлы так, чтобы создать круговую топологию:
for {set i 0} {$i < ($N-1)} {incr i} {
	$ns duplex-link $n($i) $n([expr ($i+1)%($N-1)]) 1Mb 10ms DropTail
}

$ns duplex-link $n(1) $n(5) 1Mb 10ms DropTail

#Зададим передачу данных от узла n(0) к узлу n(5):

set tcp0 [new Agent/TCP/Newreno]
$ns attach-agent $n(0) $tcp0

# создание приложения FTP
# и присоединение его к агенту tcp0
set ftp [new Application/FTP]
$ftp attach-agent $tcp0

# создание агента-получателя для tcp5
set sink5 [new Agent/TCPSink/DelAck]
$ns attach-agent $n(5) $sink5


$ns connect $tcp0 $sink5

# Добавим команду разрыва соединения между узлами n(1) и n(2) на время в одну
# секунду, а также время начала и окончания передачи данных:
$ns at 0.5 "$ftp start"
$ns rtmodel-at 1.0 down $n(0) $n(1)
$ns rtmodel-at 2.0 up $n(0) $n(1)
$ns at 4.5 "$ftp stop"
$ns at 5.0 "finish"


# at-событие для планировщика событий, которое запускает
# процедуру finish через 5 с после начала моделирования
$ns at 5.0 "finish"
# запуск модели
$ns run