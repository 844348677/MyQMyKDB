/ q�е��������ݽṹ���չ�����list��dictionary��һ��list��table�������dictionary��keyed table��һ��table
/ list��Ԫ������һ�µģ���simple list����ѧ�е���������ѵĴ洢�ͱ�����ʽ
/ q��list�����ƶ�̬��������
/ list������ļ���
/ listʹ�����Ŵ������ڲ�Ԫ��ʹ�÷ֺŷָ����ո��ǿ�ѡ��
(1; 1.1; `1)
(1;2;3)
("a";"b";"c";"d")
(`Life;`the;`Universe;`and;`Everything)
(-10.0; 3.1415e; 1b; `abc; "z")
((1; 2; 3); (4; 5))
((1; 2; 3); (`1; "2"; 3); 4.4)
/ list��˳���Ǵ����ң�1;2��2;1�ǲ�ͬ�ģ�ʱ�����и���
/ ���Խ�list��ֵ������
L1:(1;2;3)
L2:("z";"a";"p";"h";"o";"d")
L3:((1; 2; 3); (`1; "2"; 3); 4.4)
/ count�����������õ�list��Ԫ�صĸ���
count (1; 2; 3)
count L1
/ list�������ɵ����Ԫ�ظ���Ϊ2^64-1
/ count����Ԫ�صõ���ֵ��1�����ܵ���ԭ�Ӳ���list
count 42
count `zaphod
/ first��last�����ֱ�õ�list�ĵ�һ�������һ��Ԫ��
first (1; 2; 3)
last (1; 2; 3)
/ list�е�Ԫ��ͬһ���ͽ�simple list��������ѧ�е�vector�����ٵ��ڴ�ռ䣬����Ĳ���
/ q��̬��ת��simple list���������룬simple list�Ĵ�������ʡ������
/ q�жԱ�Ψһ��ʹ��~����ȸ���
(100;200;300)
100 200 300
100 200 300~(100; 200 ; 300)
(1h; 2h; 3h)
(100i; 200i; 300i)
/ ���͵�β����ʶ������Ҫ��ÿ��Ԫ�غ��涼���ϣ�������simple list
(1; 2; 3h)
(123.4567; 9876.543; 99.0)
123.4567 9876.543 99
1.0 2.0 3.0
1 2 3f~1.0 2.0 3.0
/ �������а������������������Զ�ת�ɸ�����
1.1 2 3.3~1.1 2.0 3.3
(0b;1b;0b;1b;1b)
(0x20;0xa1;0xff)
0x20a1ff~(0x20;0xa1;0xff)
3?0Ng
(`Life;`the;`Universe;`and;`Everything)
`Life`the`Universe`and`Everything
/ ����symbol listʱ��������symbole�мӿո񣬻��������
/ `bad `news
("s"; "t"; "r"; "i"; "n"; "g")
/����ʹ��=�ж��������Ȳ�ͬ��string�����ǿ���ʹ��~�ж�Ψһ
/ "string"="text"
"string"~"text"
(2000.01.01; 2001.01.01; 2002.01.01)
(00:00:00.000; 00:00:01.000; 00:00:02.000)
/ ʱ�����ͻ��Զ�ת�ɿ������ͣ�����simple list
12:34 01:02:03
01:02:03 12:34
01:02:03 12:34 11:59:59.999u
/ ��list�е�Ԫ��Ϊ�����һ����ʱ������ر𣬷ֱ�Ϊ���б��͵����б�
/ �������б�ʹ��һ�����ţ��м�û���κζ���
()
/ �����ǿ����ʾ���б���ʹ������-3!�������ǿ�ƽ�ʵ����ʾstring
L:()
-3!L 
/ �����б��͵���Ԫ�ز�һ��
/ �����б��Ĵ���ʹ��enlist����
enlist 42
/ ��char��string������ֱ��ʹ��"a"����Ҫʹ�ú���enlist
"a"
enlist "a"
/ �����е�Ԫ�ؿ������κε�qʵ��
enlist 1 2 3
enlist (10 20 30; `a`b`c)
/ list��˳���Ǵ����ң�����ʹ��index����ȡ��Ӧλ�õ�Ԫ�أ�0��n-1��index��n��û��Ԫ��
/ ʹ�÷����Ű���index������list�е�Ԫ�أ�indexԽ�緵��nullֵ
(100; 200; 300)[0]
100 200 300[0]
L:100 200 300
L[0]
L[1]
L[3] / index out of bounds returns null value
L[2]
/ ����ʹ��index����λ�ý��и�ֵ
L:1 2 3
L[1]:42
L
/ �ڶ�simple list��Ԫ�ظ�ֵ�����ͱ���ǿ��ƥ�䣬խ���Ͳ�������Ϊ������
/ indexΪ��Ч��ֵ�����
L:(-10.0; 3.1415e; 1b; `abc; "z")
/ L[1.0]
/ indexԽ�粻��������󣬻᷵�ؿ�ֵ����ʾȷʵ����
L1:1 2 3 4
L1[4]
L2:1.1 2.2 3.3
L2[-1]
L3:(`1; 2; 3.3)
L3[0W]
/ ���ʡ����index���򷵻�����list
L:10 20 30 40
L[]
/ ȷʵindex��indexΪ���б������ã�indexΪ���б������ؿ��б�������ǿ�����
-3!L[()]
L[::]
L:(::; 1 ; 2 ; 3)
type L
-3!L[0]
/ ʹ��::ռλ�������Է�ֹlist���Զ�ת��simple list
L:(1; 2; 3; `a)
L[3]:4
L
/ L[3]:`a
L:(::; 1 ; 2 ; 3; `a)
L[4]:4
L[4]:`a
/ list�п��Ժ��б���ʽ
a:42
b:43
(a; b)
L1:1 2 3
L2:40 50
(L1; L2)
(count L1; sum L2)
/ list�к��б���������ʱ����ʡ������
/ a b
/ �ϲ�listʹ�ö��ţ����ұ߲������ӵ���߲���β�����������߲�����������ԭ��
1 2 3,4 5
1,2 3 4
1,2 3 4
/ join�������Ͳ�ͬ������general list
1 2 3,4.4 5.5
/ merge������ͬlength��list���ұ�list��ֵ�滻��߶�Ӧλ�õ�ֵ�������ұ�ֵΪnull
L1:10 0N 30
L2:100 200 0N
L1^L2
/ list������Ϊ��ѧӳ���ϵ��������Ϊindex��ֵ��ΪL[i]
101 102 103 104
(`a; 123.45; 1b)
(1 2; 3 4)
/ list���Կ���map�����ǲ���ʱһԪ��
/ Ƕ���б�����Ԫ�ص����Ϊ0��simple list�����Ϊ1��depth
L:(1;2;(100;200))
count L
L:(1;2;100 200)
count L
L[0]
L[1]
L[2]
L2:((1;2;3);(`ab;`c))
count L2
L3:((1; 2h; 3j); ("a"; `bc`de); 1.23)
count L3
L3[1]
count L3[1]
/ depthΪ2�ĵ����б����б��е�ΨһԪ��Ϊsimple list
L4:enlist 1 2 3 4
count L4
count L4[0]
/ ����
m:((11; 12; 13; 14); (21; 22; 23; 24); (31; 32; 33; 34))
m
m[0]
m[1]
m[1][0]
L:(1; (100; 200; (1000; 2000; 3000; 4000)))
L[0]
L[1]
L[1][2]
L[1][2][0]
/ ����index��ȡԪ�أ�ͬʱ����ʹ��indexing at depth��ʹ�÷����ţ��ֺŷָ��ȡǶ���б�Ԫ��
/ �ϸ���﷨�ǣ��������ڲ���index��nest list��depth��ͬ
L[1;2;0]
/ ��Ƕ���б���ֵ��ʹ��index at depth������index�ķ�����Ч
L:(1; (100; 200; (1000 2000 3000 4000)))
L[1; 2; 0]: 999
L
/ L[1][2][0]:42
/ ��Ϊ�м������ڵ�ʱ�����ޣ��޷�Ѱַ��ʵ��
m:((11; 12; 13; 14); (21; 22; 23; 24); (31; 32; 33; 34))
m
m[0][0]
m[0; 0]
m[0; 1]
m[1; 2]
/ ��list�ع��ɾ���0N��ʾȷʵ���ݣ�ʹ��#���ţ�������n��m�У��Ҳ���Ϊlist
2 0N#til 10
0N 3#til 10
/ q��������������
L:100 200 300 400
L[0]
L[2]
/ index����Ϊlist��ͬʱ�������Ԫ��
L[0 2]
/ �����ĵ����б�����index�е�list����ƥ��
L[3 2 0 1]
L[0 2 0]
01101011b[0 2 4]
"beeblebrox"[0 7 8]
/ ע��û�зֺŷָ�
/ index����Ϊ����
L
I:0 2
L[I]
/ index��ΪǶ���б�
L:100 200 300 400
L[(0 1; 2 3)]
/ ͨ��index��listԪ�ظ�ֵ
L:100 200 300 400
L[0]:100
L
L[1 2 3]:2000 3000 4000
L
/ ��ֵ��˳�������
L[3 2 1]:999 888 777
L[3]:999
L[2]:888
L[1]:777
/ ��˶�θ�ֵ�����ұߵĸ�ֵ������Ч
L:100 200 300 400
L[0 1 0 3]:1000 2000 3000 4000
L
L:100 200 300 400
L[1 3]:999
L
/ ����������ȡֵ���ں���ʽ����м򵥵�д����ʡ�Է����źͷֺţ�����д���ո�ָ�
L:100 200 300 400
L[0]
L 0
L[2 1]
L 2 1
I:2 1
L I
L ::
/ ����ϲ��
/ findʹ�ö�Ԫ�������ʺ�?�������list�в����ұ�Ԫ�أ�����Ӧ������ֵ
1001 1002 1003?1002
/ ���û���ҵ����򷵻�list��length
1001 1002 1003?1004
/ ���ұ߲�������Ҫ����Ϊlist���Դ˲����ڲ�Ԫ�أ�����index��list
1001 1002 1003?1003 1001
m:(1 2 3 4; 100 200 300 400; 1000 2000 3000 4000)
m
/ ������ʡ�Ե�����һ��index���������л�������
m[1;]
m[;3]
m[1;]~m[1]
L:((1 2 3;4 5 6 7);(`a`b`c`d;`z`y`x`;`0`1`2);("now";"is";"the"))
L
L[;1;]
L[;;2]
L[0 2;;0 1]
L:(1 2 3; (10 20; 100 200; 1000 2000))
L
/ ����list������ʹ��flip�������������ת��
L:(1 2 3; 10 20 30; 100 200 300)
L
flip L
L:(1 2 3; 10 20 30; 100 200 300)
M:flip L
L[1;2]
M[2;1]
/ ����qû��tuple��q�е�vector���Բ�����ֵ���ͣ������γ��Ϊ1ʱ��Ϊ������
v1:1 2 3 / vector of integers
v2:98.60 99.72 100.34 101.93 / float vector
v3:`so`long`and`thanks`for`all`the`fish / symbol vector
/ ��ά����Ƕ���б���ÿ��Ԫ��Ϊһ�У��в����죬�в�����
/ ������Կ����еļ��ϣ���ά��������кܿ�
/ table���е�ת�ã������ڶ�table���в����ܿ죬��Ϊsimple list������ʱ�������ǣ�������ƽ���б�
/ һ����ʱ��ֵ��һ��������ֵ�����е���vector�������ܿ죬Ч�ʸ�
mm:((1 2;3 4;5 6);(10 20;30 40;50 60))
mm
mm[0]
mm[1]
m:(1 2; 10 20; 100 200; 1000 2000)
m 0 2
/ til����һ���Ǹ��������ɴ�0��ʼ��n��������list
til 10
1+til 10
2*til 10
1+2*til 10
-5+4*til 3
/ distinctȥ�ظ���˳��ΪԪ�ص�һ�γ��ֵ�˳��
distinct 1 2 3 2 3 4 6 4 3 5 6
/ where����ֵΪ1b��index list
where 101010b
/ where�����õ�һ�㣬����ʶ��list�е��ж�����
L:10 20 30 40 50
L[where L>20]:42
L
/ groupһԪ����������Ϊlist����list��Ԫ�ؽ��з��飬�Դ˷��ظ�Ԫ�ص����ڵ�indexֵ
group "i miss mississippi"