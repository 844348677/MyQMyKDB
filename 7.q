/ ����ת��
/ ǿת����������ת���ܼ��ݵ���һ�����ͣ���ʱ�ܰ�����ȷ��Ϣ����ʱ�ᶪʧ����
/ ��q��ö�ٺͽ���Ҳ������ǿת����
/ ��������������
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
/ dicionary��99h����98h�أ�
/ һԪ����������ԭ�Ӻ���type������qʵ����������ͣ���ʽ��type num�������atom���Ǹ�ֵ��simple list����ֵ
type 42
type 10 20 30
type 98.6
type 1.1 2.2 3.3
type `a
type `a`b`c
type "z"
type "abc"
/ ����ֵ��nullֵҲ��������
type 0W
type 0N
type -0w
type 0n
type `
/ �κε�general list������ֵΪ0h
type (42h; 42i; 42j)
type (1 2 3; 10 20 30)
type ()
/ dictionary��keyed table��ֵ��99h
type (`a`b`c!10 20 30)
type ([k:`a`b`c] v:10 20 30)
/ table��ֵ��98h
type ([] c1:`a`b`c; c2:10 20 30)
/ q�Ƕ�̬�������ԣ�����Ҳ�����ͣ��ǵ�ǰ��ֵ�����ͣ����öԱ�����������
a:42
type a
a:"abc"
type a
/ ����a������`a����������ֵ��һ������
/ ��������һ�α���ֵ��q�������������ΪΪkey `a��ȫ�ֱ�����dictionary�У��ٽ��丳ֵΪ42
/ ʹ��get `.�����Բ鿴ȫ�ֱ������ֵ�
get `.
/ ֮���`a��ֵ���޸�Ϊ"abc"
/ ���������ͣ��Ǳ������������ӵ�ֵ������
/ q��ȫ�ֱ���������ͨ��q�ֵ��У��и���������ֽ�`.��ˢ��q session����ʾ���е��ֵ��д��ڵı�����ʹ��value
value `.
a:42
value `.
f:{x*x}
value `.
/ ǿת��һ�����͵�Ǳ��ֵת����һ����������ֵ������short��ת��long
/ q�Ƕ�̬���ͣ�ǿת������run-time��ʹ�ö�Ԫ������$�����Ҳ�������ԭ�ӣ����ʳ�����ͣ��Ҳ���ʱ����Դ
/ ���ַ�ʽ����������shortֵ�����͵�char�����͵�symbol
/ ǿת�������ͣ�û����Ϣ��ʧ��Ŀ�������ǿ�����
7h$42i / int to long
6h$42 / long to int
9h$42 / long to float
"j"$42i
"i"$42
"f"$42
/ ʹ�����͵�symbol���֣��ɶ���ǿ
`int$42
`long$42i
`float$42
/ ��ͬ���͵�ֵת�����ײ�ֵ����ͬ�ģ�
`char$42
`long$"\n"
/ ʵ�����͵ĵײ�ֵ����ֵ
`date$0
`int$2001.01.01 / millennium occurred on leap year
`long$12:00:00.0000000000
`timespan$0
/ ת��Ϊխ���ͻ���ʧ��Ϣ��
`long$12.345
`short$123456789
/ ��ֵ��ת��boolean������0��0b����������1b
`boolean$0
`boolean$0.0
`boolean$123
`boolean$-12.345
/ �ܹ��Ӹ������ͣ���ȡֵ
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
/ ���ַ�ʽ���ڵ������������������ٺ����ڲ�ʹ��
/ ת������ֵ��������ֵת��Ϊ�����ͣ��ײ�Ķ������������½��ͣ����ڿ�����ֵ������ֵ
`int$0Wh
`int$-0Wh
`long$0Wi
`long$-0Wi
/ ǿת�ᱨ���ʹ���simple list�����ϸ�ƥ������
L:10 20 30 40
/ L[1]:42h
/ L[1]:42h
/ �ṩ�Ϸ���ǿ��ת��simple list������
L[1]:(type L)$42h
L,:(type L)$43h
L
"i"$10 20 30
`float$(42j; 42i; 42j)
`short`int`long$42
"ijf"$98.6
"ijf"$10 20 30
/ ����string�ܹ�����һ��qʵ�壬�����ı�������ʽΪ�˿���̨������ļ������
/ �������list of char�����ǵ���char���ܹ��õ�����char
string 42
string 4
string 42i
a:2.0
string a
f:{x*x}
string f
/ string����ʱαԭ�����Ե�
string 1 2 3
string "string"
string (1 2 3; 10 20 30)
/ ʹ��string��symbolת����string
string `Life`the`Universe`and`Everything
/ ��stringת��symbol�Ǻܼ��ķ�ʽ����symbol��Ψһ�ķ�ʽ����symbol��Ƕ��ո�
`$"abc"
`$"Hello World"
/ ʹ��`$������ʹ��`symbol$
`$"Zaphod \"Z\""
`$"Zaphod \n"
/ �޷���string�п�ͷ�ͽ�β�Ŀո�ת��symbol
string `$" abc "
/ `$��Ԫ��������ԭ�����Եģ��ܽ�����lsitת��symbol
`$("Life";"the";"Universe";"and";"Everything")
/ $�����ط��������Ը��ݽ�����string��������ת�ɸ����ͣ�ȱʧ���ݻ��߻����ݻ����nullֵ���������쳣
"J"$"42"
"F"$"42"
"F"$"42.0"
"I"$"42.0"
"I"$" "
/ �����﷨��������ʽ����������
"D"$"12.31.2014"
"D"$"12-31-2014"
"D"$"12/31/2014"
"D"$"12/1/2014"
"D"$"2014/12/31"
/ ����string����������ʹ�����÷��� value������parse���������Ľ��Ͳ���
value "{x*x}"
parse "{x*x}"
/ һ��Ŀ��б��typeֵ��0h
type ()
/ �����б����Ԫ�أ����ͷ����仯
L:()
type L
L,:42
type L
/ ��listΪtable�е�column�����������columnΪfloat list��Ϊ��list����ǰ���longֵ������Ӳ���floatֵ����������
c1:()
c1,:42
/ c1,:98.6
/ �������б��ʱ��ָ����Ӧ�����ͣ�ֻ�и����͵�Ԫ�������
c1:`float$()
/ c1,:42
c1:98.6
c1
0#10 20 30
0#0
0#0.0
0#`
/ There is no way in q to type nested empty lists.
/ casting������&����߲���������չΪ�û��Զ����Ŀ���������ṩö�����͹���
/ unique list of symbols u
u:`g`aapl`msft`ibm
v:1000000?u
v
u:distinct v
u
/ k��ָ��v�е�Ԫ�أ���u�е�index��ʹ�ò���?
u:`g`aapl`msft`ibm
v:1000000?u
k:u?v
k
/ u��kһ��Я������Ϣ��ͬ��v�������ع�v
u[k]
v~u[k]
/ u��k��Ч�����⣬u�������б�k��u�е�index��ֵ
/ v = u��k
v:`ccccccc`bbbbbbb`aaaaaaa`ccccccc`ccccccc`bbbbbbb
u:distinct v
u
k:u?v
k
/ ��symbol�б�ת�ɵȼ۵�index�ѽţ�����enumeration��
/ ʹ��$�����������������Ǳ��������֣�����Ψһ��symbols list���ұ���symbol�е�ֵ����ɵ�list
/ �ײ���index��������symbol���ɶ�Ӧ��index����ʾ���䣬���ǵײ㾭���˲���
`u$v
/ �ܹ����ײ��Ӧ������ֵ��ǿת��ʾ
ev:`u$v
`int$ev
/ symbol��ö�����͸�ʽ��`u$v
/ u��Ψһ��symbol��simple list��v��u��Ԫ����ɵ�list��������Ƕ�ף�u����ö�ٵ�������ӳ��`u$������ö��
/ v�е�����Ԫ�ر�����u�У�����ᱨ��
/ u:`a`b`c
/ `u$`d
/ ��kdb�У����е�����symbol�ж���ö�ٵ�������������sym�ϣ���������sym list��sym file
/ ö��������32bit
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
/ �������е�����£�ev���ܴ���ԭ����v��ö�ٱ�����ʾ�������䣬���ǵײ㶼��ö�ٹ����indexֵ
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
/ ev��ԭv��ʵ�岻�ȣ�λ�õ�Ч
all v=ev
v~ev
/ ÿһ��ö�����Ͷ������һ���µ��������ͣ���20h��ʼ��20h������sym��������ö�����ʹ�21h��ʼ���ε�������ֵΪatom����ֵΪsimple list
sym1:`g`aapl`msft`ibm
type `sym1$1000000?sym1
sym2:`a`b`c
type `sym2$`c
/ sym domain��������20h������������������ö��֮��
sym:`b`c`a
type `sym$100?sym
/ ö�ٵĲ�ͬ��domain�ǲ�ͬ�ģ�����domain��Ӧλ�õ�ֵ����ͬ��
sym1:`c`b`a
sym2:`c`b`a
ev1:`sym1$`a`b`a`c`a
ev2:`sym2$`a`b`a`c`a
ev1=ev2
ev1~ev2
/ ���ı�u�е�Ԫ�أ���ʾ��ev�е�Ԫ�ض�һͬ����
sym:`g`aapl`msft`ibm
ev:`sym$`g`g`msft`ibm`aapl`aapl`msft`ibm`msft`g`ibm
sym[0]:`twit
sym
ev
/ Ȼ��v�е�Ԫ��Ҫ���θı�
v
@[v; where v=`g; :; `twit]
/ ���޸�sym list��ʱ��ǳ�С�ģ�����ƻ���sym list�������ݿ��ҵ������ݣ�������Ҫ�޸�
/ ��Ҫ�����ֵ��
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
v,:`twtr
/ ev,:`twtr
/ �����ֵ������������unique list�����
sym,:`twtr
ev,:`twtr
/ ������������ֵ���������ж�ֵ�Ƿ��Ѿ���ö�ٵ��������У�û��������ӣ�q�н���������
/ �����֪�������ö�����÷�Χ��ʹ��֮ǰ������ʹ�����ص��ʺŲ�����?����domain on the fly
/ ?�ľ䷨��ʽ��ö�ٵ�$һ����?����������ã�����domain�����û�е�symbolֵ
sym:()
/ `sym$`g
`sym?`g
sym
`sym?`ibm`aapl
sym
`sym?`g`msft
sym
/ ֮ǰ����Ӳ����ܹ����У�ͨ��ʹ��?����$
/ ev,:`u?`twtr
/ �ֽ�ev��ֵ��ʹ��value������value�����ص�
sym:`g`aapl`msft`ibm
v:1000000?sym
ev:`sym$v
value ev
v~value ev

/ ����������ں��棬table��q-sql������Ҫ���ĵط�����ȥ˯���ɣ������ټ����ɣ�2017/08/24 01:21