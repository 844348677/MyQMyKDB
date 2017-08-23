/ 数据转换
/ 强转可以是类型转成能兼容的另一个类型，有时能包含精确信息，有时会丢失精度
/ 在q中枚举和解析也适用于强转类型
/ 基本的数据类型
/ boolean	`boolean	B	1h
/ guid	`guid	G	2h
/ byte	`byte	X	4h
/ short	`short	H	5h
/ int	`int	I	6h
/ long	`long	J	7h
/ real	`real	E	8h
/ float	`float	F	9h
/ char	`char	C	10h
/ symbol	`	S	11h
/ timestamp	`timestamp	P	12h
/ month	`month	M	13h
/ date	`date	D	14h
/ datetime	`datetime	Z	15h
/ timespan	`timespan	N	16h
/ minute	`minute	U	17h
/ second	`second	V	18h
/ time	`time	T	19h
/ dicionary是99h还是98h呢？
/ 一元操作符，非原子函数type，返回q实体的数据类型，格式是type num，如果是atom则是负值，simple list是正值
type 42
type 10 20 30
type 98.6
type 1.1 2.2 3.3
type `a
type `a`b`c
type "z"
type "abc"
/ 无穷值和null值也存在类型
type 0W
type 0N
type -0w
type 0n
type `
/ 任何的general list的类型值为0h
type (42h; 42i; 42j)
type (1 2 3; 10 20 30)
type ()
/ dictionary和keyed table的值是99h
type (`a`b`c!10 20 30)
type ([k:`a`b`c] v:10 20 30)
/ table的值是98h
type ([] c1:`a`b`c; c2:10 20 30)
/ q是动态类型语言，变量也有类型，是当前绑定值的类型，不用对变量声明类型
a:42
type a
a:"abc"
type a
/ 变量a是名字`a和他所附的值的一种链接
/ 当变量第一次被赋值，q解释器创建入库为为key `a在全局变量的dictionary中，再将其赋值为42
/ 使用get `.，可以查看全局变量的字典
get `.
/ 之后键`a的值被修改为"abc"
/ 变量的类型，是变量名字所链接的值的类型
/ q的全局变量存在普通的q字典中，有个特殊的名字叫`.，刷新q session，显示所有的字典中存在的变量，使用value
value `.
a:42
value `.
f:{x*x}
value `.
/ 强转将一个类型的潜在值转成另一个兼容类型值，例如short能转成long
/ q是动态类型，强转发生在run-time，使用二元操作符$，左右参数都是原子，左蚕食是类型，右参数时数据源
/ 三种方式，正的类型short值，类型的char，类型的symbol
/ 强转提升类型，没有信息损失，目标类型是宽类型
7h$42i / int to long
6h$42 / long to int
9h$42 / long to float
"j"$42i
"i"$42
"f"$42
/ 使用类型的symbol名字，可读性强
`int$42
`long$42i
`float$42
/ 不同类型的值转换，底层值是相同的，
`char$42
`long$"\n"
/ 实践类型的底层值是数值
`date$0
`int$2001.01.01 / millennium occurred on leap year
`long$12:00:00.0000000000
`timespan$0
/ 转换为窄类型会损失信息，
`long$12.345
`short$123456789
/ 数值型转成boolean，出了0是0b，其他都是1b
`boolean$0
`boolean$0.0
`boolean$123
`boolean$-12.345
/ 能够从负载类型，抽取值
`date$2015.01.02D10:20:30.123456789
`year$2015.01.02
`month$2015.01.02
`mm$2015.01.02
`dd$2015.01.02
`hh$10:20:30.123456789
`minute$10:20:30.123456789
`uu$10:20:30.123456789
`second$10:20:30.123456789
`ss$10:20:30.123456789
/ 这种方式优于点操作符，点操作不能再函数内部使用
/ 转换无穷值，当无穷值转换为宽类型，底层的二进制类型重新解释，对于宽类型值是正常值
`int$0Wh
`int$-0Wh
`long$0Wi
`long$-0Wi
/ 强转会报类型错误，simple list必须严格匹配类型
L:10 20 30 40
/ L[1]:42h
/ L[1]:42h
/ 提供合法的强制转换simple list的类型
L[1]:(type L)$42h
L,:(type L)$43h
L
"i"$10 20 30
`float$(42j; 42i; 42j)
`short`int`long$42
"ijf"$98.6
"ijf"$10 20 30
/ 函数string能够接受一个q实体，产生文本表现形式为了控制台输出和文件输出，
/ 结果总是list of char，不是单个char，能够得到单例char
string 42
string 4
string 42i
a:2.0
string a
f:{x*x}
string f
/ string函数时伪原子属性的
string 1 2 3
string "string"
string (1 2 3; 10 20 30)
/ 使用string将symbol转换成string
string `Life`the`Universe`and`Everything
/ 将string转成symbol是很简答的方式创建symbol，唯一的方式能在symbol中嵌入空格
`$"abc"
`$"Hello World"
/ 使用`$而不是使用`symbol$
`$"Zaphod \"Z\""
`$"Zaphod \n"
/ 无法将string中开头和结尾的空格，转成symbol
string `$" abc "
/ `$二元操作符是原子属性的，能将整个lsit转成symbol
`$("Life";"the";"Universe";"and";"Everything")
/ $的重载方法，可以根据解释性string，将数据转成该类型，缺失数据或者坏数据会产生null值，而不是异常
"J"$"42"
"F"$"42"
"F"$"42.0"
"I"$"42.0"
"I"$" "
/ 数据语法分析，格式化日期类型
"D"$"12.31.2014"
"D"$"12-31-2014"
"D"$"12/31/2014"
"D"$"12/1/2014"
"D"$"2014/12/31"
/ 根据string创建函数，使用内置方法 value，或者parse，解释器的解释步骤
value "{x*x}"
parse "{x*x}"
/ 一般的空列表的type值是0h
type ()
/ 往空列表添加元素，类型发生变化
L:()
type L
L,:42
type L
/ 当list为table中的column，会产生错误，column为float list，为空list，提前添加long值，再添加不了float值，产生错误
c1:()
c1,:42
/ c1,:98.6
/ 创建空列表的时候，指定对应的类型，只有该类型的元素能添加
c1:`float$()
/ c1,:42
c1:98.6
c1
0#10 20 30
0#0
0#0.0
0#`
/ There is no way in q to type nested empty lists.
/ casting操作符&的左边参数可以扩展为用户自定义的目标作用域，提供枚举类型功能
/ unique list of symbols u
u:`g`aapl`msft`ibm
v:1000000?u
v
u:distinct v
u
/ k是指明v中的元素，在u中的index，使用查找?
u:`g`aapl`msft`ibm
v:1000000?u
k:u?v
k
/ u和k一起携带的信息等同于v，可以重构v
u[k]
v~u[k]
/ u和k，效率问题，u是名字列表，k是u中的index数值
/ v = u·k
v:`ccccccc`bbbbbbb`aaaaaaa`ccccccc`ccccccc`bbbbbbb
u:distinct v
u
k:u?v
k
/ 将symbol列表转成等价的index裂脚，叫做enumeration，
/ 使用$操作符，做操作符是变量的名字，持有唯一的symbols list，右边是symbol中的值域组成的list
/ 底层是index操作，将symbol换成对应的index，显示不变，但是底层经历了操作
`u$v
/ 能够将底层对应的整数值，强转显示
ev:`u$v
`int$ev
/ symbol的枚举类型格式，`u$v
/ u是唯一的symbol的simple list，v是u中元素组成的list，可能是嵌套，u叫做枚举的作用域，映射`u$，叫做枚举
/ v中的所有元素必须在u中，否则会报错
/ u:`a`b`c
/ `u$`d
/ 在kdb中，表中的所用symbol列都被枚举到公共的作用域sym上，将会听到sym list或sym file
/ 枚举类型是32bit
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
/ 几乎所有的情况下，ev都能代替原来的v，枚举表面显示基本不变，但是底层都是枚举过后的index值
v[3]
ev[3]
v[3]:`ibm
ev[3]:`ibm
v=`ibm
ev=`ibm
where v=`aapl
where ev=`aapl
v?`aapl
ev?`aapl
v in `ibm`aapl
ev in `ibm`aapl
/ ev和原v的实体不等，位置等效
all v=ev
v~ev
/ 每一个枚举类型都会分配一个新的数据类型，从20h开始，20h被留作sym，其他的枚举类型从21h开始依次递增，负值为atom，正值为simple list
sym1:`g`aapl`msft`ibm
type `sym1$1000000?sym1
sym2:`a`b`c
type `sym2$`c
/ sym domain的类型是20h，尽管他创建在其他枚举之后
sym:`b`c`a
type `sym$100?sym
/ 枚举的不同的domain是不同的，尽管domain对应位置的值是相同的
sym1:`c`b`a
sym2:`c`b`a
ev1:`sym1$`a`b`a`c`a
ev2:`sym2$`a`b`a`c`a
ev1=ev2
ev1~ev2
/ 当改变u中的元素，显示的ev中的元素都一同变了
sym:`g`aapl`msft`ibm
ev:`sym$`g`g`msft`ibm`aapl`aapl`msft`ibm`msft`g`ibm
sym[0]:`twit
sym
ev
/ 然后v中的元素要依次改变
v
@[v; where v=`g; :; `twit]
/ 当修改sym list的时候非常小心，如果破坏了sym list整个数据库会挂掉，备份，尽量不要修改
/ 需要添加新值，
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
v,:`twtr
/ ev,:`twtr
/ 添加新值，必须先在在unique list中添加
sym,:`twtr
ev,:`twtr
/ 如果冬天的生成值，必须先判断值是否已经在枚举的作用域中，没有则先添加，q有解决这种情况
/ 如果不知道这个的枚举作用范围在使用之前，可以使用重载的问号操作符?创建domain on the fly
/ ?的句法形式和枚举的$一样，?会产生副作用，会网domain中添加没有的symbol值
sym:()
/ `sym$`g
`sym?`g
sym
`sym?`ibm`aapl
sym
`sym?`g`msft
sym
/ 之前的添加操作能够运行，通过使用?代替$
/ ev,:`u?`twtr
/ 分解ev的值，使用value函数，value是重载的
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
value ev
v~value ev

/ 悲剧的两章在后面，table和q-sql，最重要最精髓的地方，先去睡觉吧，明早再继续吧，2017/08/24 01:21