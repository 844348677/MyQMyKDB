42
6*7
/ 运行q脚本，q脚本文件后缀.q，在控制台输入 \l 脚本文件路径
"c"$0x57656c6c20646f6e6521
/ 变量赋值，变量类型可变，使用:，q中=用来判断相等
a:42
a
/ 变量名字必须字母开始，可以使用数字，下划线
/ 变量名不要使用保留字，不要使用下划线
show a:42
/ q没有必要解释错误信息
/ q中的赋值可以在表达式中
1+a:42
b:1+a:42
b
/ 基础的整数类型是long，64位
/ 基础的浮点型是float，64位
/ 除号使用%
4%2
42=40+2
/ 常用的时间类型为date和timespan
2000.01.01
2014.11.19
1999.12.31
12:00:00.000000000
/ 想前进5天，date加5
2000.01.01+5
12:00:00.000000000+1000
/ 判断时间值，底层所代表的数值
2000.01.01=0
12:00:00.000000000=12*60*60*1000000000
/ q中的所有名字都是symbol，symbol是原子属性的，不可分割，back tick，没有空格
`aapl
`aapl=`apl
/ q中最基础的数据结构是list，有序集合，左到右，元素分隔符;
(1;1.2;`one)
(1;2;3)
(1.2;2.2;3.3)
(2000.01.01;2000.01.02;2001.01.03)
(1b;0b;1b)
(`one;`two;`three)
/ til接受一个非负整数n，从0开始生成n个整数
til 10
1+til 10
2*til 10
1+2*til 10
42+2*til 10
/ join将右边的list，连接到有左边的list上
1 2 3,4 5
1 2 3,100
1 2 3,100
/ 截取操作符#，返回的是list，
2#til 10
-2#til 10
/ 0#返回的是空列表，用来生成对应格式的空列表
0#1 2 3
0#0
0#`
/ 截取的个数可以大于list的长度，从开始位置重新截取
5#1 2 3
/ #可以接受单一元素，复制指定长度的相同元素
5#42
/ list可以通过索引值来访问，使用方括号调用
L:10 20 30
L[0]
L[1]
L[1]
/ q中的内置操作符都是函数，内置函数底层语言是k或者C，内置函数可以使用中缀表达式，自定义只能使用前缀
/ q中函数满足lambda表达式，有匿名函数，一级公民，不是纯粹的函数式，可以调用外部变量
{[x] x*x}
sq:{[x] x*x}
{[x;y] a:x*x; b:y*y; a+b}
pyth:{[x;y] a:x*x; b:y*y; a+b}
/ 调用函数只用[]里面的元素，匹配函数中的参数，最后的表达式被返回
{[x] x*x}[5]
sq[5]
{[x;y] a:x*x; b:y*y; a+b}[3;4]
pyth[3;4]
/ 局部变量创建和生存在函数的调用之中
/ 函数中的参数可以省略声明x,y,z
{x*x}[5]
{a:x*x; b:y*y; a+b}[3;4]
/ q中的函数调用可以省略方括号，当参数个数为1的时候，可以函数和参数并列，调用
{x*x} 5
f:{x*x}
f 5
/ q中的函数作用在list上，会自动匹配复杂的数据结构，知道作用在原子类型上
/ list与atom相加，atom与list相加，相同长度的list相加
42+100 200 300
100 200 300+42
100 200 300+1 2 3
100=99 100 101
100 100 100=100 101 102
100<99 100 101
/ q满足高阶函数，副词可以修饰动词，累积循环迭代
/ /是副词，用来循环迭代参数运行函数
0 +/ 1 2 3 4 5
0 +/ 1+til 100
0 {x+y}/ 1 2 3 4 5
0 {x+y}/ 1+til 100
/ 不必指定初始值，直接作用在list，从开始元素到尾部元素
(+/) 1 2 3 4 5
(+/) 1+til 100
(*/) 1+til 10
/ |返回左右两个参数的最大值，&返回左右两个参数的最小值
/ 使用|和&和副词，返回list的最大值和最小值
(|/) 20 10 40 30
(&/) 20 10 40 30
sum 1+til 10 / this is +/
prd 1+til 10 / this is */ -- note missing "o"
max 20 10 40 30 / this is |/
min 20 10 40 30 / this is &/
/ /接受一个函数，返回一个新的函数，聚合原始的list，产生单一的结果值
(*/) 2#1.4142135623730949
n:5
(*/) n#10
/ \聚合的每步都显示
(+\) 1+til 10
(+\) 1+til 10
(|\) 20 10 40 30
(&\) 20 10 40 30
sums 1+til 10
prds 1+til 10
maxs 20 10 40 30
mins 20 10 40 30
/ Fibonacci Numbers
F0:1 1
F0,sum -2#F0
10 {x,sum -2#x}/ 1 1
/ 牛顿迭代法
/ 距离根不远的初始点，不停的迭代
{[xn] xn-((xn*xn)-2)%2*xn}
/ 将float值得所有信息打印
\P 0
/ 迭代显示所有值，这个在之后又讲迭代结束条件
{[xn] xn-((xn*xn)-2)%2*xn}\[1.0]
/ 不仅对2求根，对任意c值求根
{[c; xn] xn-((xn*xn)-c)%2*xn}
/ 柯里化，q中叫projection，传函数的一部分参数，得到剩下函数的参数
{[c; xn] xn-((xn*xn)-c)%2*xn}[2.0;]
{[c; xn] xn-((xn*xn)-c)%2*xn}[2.0;]/[1.0]
/ 求3的平方根
{[c; xn] xn-((xn*xn)-c)%2*xn}[2.0;]/[1.0]
/ 不仅求平方根，求p次方根
{[p; c; xn] xn-(((*/)p#xn)-c)%p*(*/)(p-1)#xn}[2; 3.0;]/[1.0]
{[p; c; xn] xn-(((*/)p#xn)-c)%p*(*/)(p-1)#xn}[5; 7.0;]/[1.0]
/ 先进先出，买卖order
buys:2 1 4 3 5 4f
sell:12f
/ 对买订单求和，和买求最小
sell&sums buys
/ list彼此之间的差值，each-previos，deltas
deltas sell&sums buys
/ 卖订单也是list
buys:2 1 4 3 5 4f
sells:2 4 3 2
/ 需要用到each left，对sells累加求和，得到的值，以此和buys求和的list进行求最小
sums[sells] &\: sums[buys]
/ 得到矩阵之后，deltas，单次调用时行之间，需要使用each
deltas each deltas sums[sells] &\: sums[buys]
/ 第二个基础的数据结构是字典，表现形式为key-value关系。一级公民值，类似于整数或者list
`a`b`c!10 20 30
d:`a`b`c!10 20 30
/ 通过key可以得到相关的值
d[`a]
/ 当value的值是，统一长度list组成的list，得到column dictionary
`c1`c2!(10 20 30; 1.1 2.2 3.3)
dc:`c1`c2!(10 20 30; 1.1 2.2 3.3)
dc[`c1]
dc[`c1][0]
dc[`c2][1]
/ 可以使用深度索引，索引值在同一个方括号中，使用分号分割
dc[`c1][0]
dc[`c1; 0]
dc[`c1; 1]
dc[`c1; 2]
/ 使用深度索引，dc接受二维实体，省略索引，省略行列，则对该行列进行全显示
dc[`c1;]
dc[`c2;]
dc[;0]
dc[;1]
dc[;2]
/ 将字典转置得到表，所以第一个参数可以是数值型索引
t:flip `c1`c2!(10 20 30; 1.1 2.2 3.3)
t[0; `c1]
t[1; `c1]
t[2; `c1]
t[0; `c2]
t[; `c1]
t[0;]
/ 字典的底层数据依旧是以column dictionary存储，索引的顺序被影响到而已
flip `c1`c2!(10 20 30; 1.1 2.2 3.3)
/ table的定义格式
([] c1:10 20 30; c2:1.1 2.2 3.3)
/ 方括号必不可少，冒号不是复制，仅仅是标记分割名字和列值，列名不是symbol，虽然底层转成了symbol
/ 操作表可以使用dictionary的操作符，可以使用q-sql
/ sql操作符的作用于是一行行的形式，q中表现为对列列表的向量操作
t:([] c1:1000+til 6; c2:`a`b`c`a`b`a; c3:10*1+til 6)
t
/ 搜索全部，不需要使用通配符*，select和from必须一起出现
select from t
select c1, val:2*c3 from t
/ 搜索结果列，使用逗号分隔，顺序从左到右，内部的计算表达式是从右到左
/ 表达式中的冒号不是赋值，语法上的分隔，左边为定义的名字，右边为计算表达式
/ 可以用任意的q表达式来生成查询值
/ 可以使用by来分组，可以使用where来进行约束条件
select count c1, sum c3 by c2 from t
/ 同时可以对计算的列使用by进行分组
select count c1, sum c3 by c2 from t
/ 和select近似的是update，可以使用冒号对列进行修改或者添加
update c3:10*c3 from t where c2=`a
/ t的原值没有发生变化，可以使用call by name来进行对原表的修改
/ update是对列进行向量操作，而不是row-by-row
/ 排序 xasc xdesc
`c2 xasc t
/ 创建一个模拟的交易表，展示q-sql的力量
/ 用问号来创建测试数据集，产生伪随机数据，问号前是生成数据个数，问号后是值范围，不包含最后一个数
10?20
10?100.0
/ 右值为list，随机选择
10?`aapl`ibm
/ 创建一百万条随机日期，2015年一月随机一天
dts:2015.01.01+1000000?31
/ 创建一百万条timespans
tms:1000000?24:00:00.000000000
/ 一百万条股票名，aapl，goog，ibm中的一个，格式为小写symbol
syms:1000000?`aapl`goog`ibm
/ 一百万条成交量，最小为10
vols:10*1+1000000?1000
/ 一百万条价格，90.0到110.00之间
pxs:90.0+(1000000?2001)%100
/ 根据随机生成的list，构造table
trades:([] dt:dts; tm:tms; sym:syms; vol:vols; px:pxs)
5#trades
/ 首先根据时间来排序
trades:`dt`tm xasc trades
5#trades
/ 调整股票价格，goog价格乘以6，ibm价格乘以2
trades:update px:6*px from trades where sym=`goog
trades:update px:2*px from trades where sym=`ibm
5#trades
/ 根据股票名字sym分组，求价格和成交量的平均值
select avg px, avg vol by sym from trades
/ 求分组的价格最大值和最小值
select avg px, avg vol by sym from trades
/ 求100毫秒的加权平均值，使用内置函数二元xbar，左值为宽度，右值为数值型list，将list中值推到宽度倍数的左端
/ 这对分组非常有用，因为将值推到了间隔值的最左端，
/ 计算权重平均值wavg，根据左边权重计算平均值
1 2 3 wavg 50 60 70
/ 根据volume的权重，计算平局值，根据股票名分组，根据100毫秒值分组
select vwap:vol wavg px by sym,bkt:100000000 xbar tm from trades
/ 交易期间的极限利润，
select max px-mins px from trades where sym=`aapl
/ char类型，双引号之间，单个ASCII字符
"a"
" "
"_"
/ "a"是一个原子，但是不同于symbol的`a
/ char类型的simple list是string，不是原子，也不是一级公民类型
("s";"t"; "r"; "i"; "n"; "g")
count "string"
count `string
/ q中的IO使用handle，没有reader，writer和序列化
/ IO的开始是 symbolic handles，symbolic file handle是特殊的symbol表示系统文件名字，冒号区别symbol
/ `:path/filename
t:([] c1:`a`b`c; c2:1.1 2.2 3.3)
t
/ 保存表t到序列化二进制文件中，使用内置函数set，左边symbolic file handle，右边参数时数据源
`:/q/test/examples/t set t
/ 读存好的数据，反序列化，使用get，接收一个symbolic file handle参数
get `:/q/test/examples/t
/ 写text文件使用操作符 0: 读text文件使用 read0
`:/q/test/life.txt 0: ("Meaning";"of";"life")
read0 `:/q/test/life.txt
/ 读写CSV文件，
/ 0: 三个不同的overload方法，一个是准备表作为文本，一个是写文本文件，一个是读格式化文件
/ 准备一个table作为csv文本，很简单
csv 0: t
/ 再将准备好的文件，写到系统文件中
`:/q/test/examples/t.csv 0: csv 0: t
read0 `:/q/test/examples/t.csv
/ 0:的第三个重载方法，是读CSV文件，作为table，右参数时symbolic file handle，左操作符是两个元素的list
/ 左边参数list中第一个元素是大写的字母，表示对应的列的类型，第二个元素是分隔符，enlist
("SF"; enlist ",") 0: `:/q/test/examples/t.csv
/ S F 表示symbol和float类型，分隔符是逗号,
/ 进程间的通信和websocket，以后有时间再写，
/ 时间 2017/08/20 00:45:00 睡觉去了