/ ��q��table��һ��ʵ�壬��list��dictionaryһ�������ݽṹ���������ڴ���
/ q��table�ı������еļ��ϣ�������dictionary��table�������еģ�dictionary�������е�
/ q��table���������б���ɣ�ʹ��kdb+Ч�ʸߣ������Ͳ����������ݣ�һ��������ʱ������
/ kdb+��handle relational��ʱ���������ݣ�������q table�У�û�зֿ������ݶ������ԣ�û�зֿ��Ĵ洢�������ԣ�����Ҫ������ʾΪ�˳־û�
/ ֻ��q table�����ʽ�ͺ���
/ table����dictionary������
/ ���Խ�table���� column dictionary��ʹ���ֵ�ʹ��flipת�õõ�
dc:`name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
dc[`iq;]
dc[;2]
dc[`iq; 2]
/ ʹ��flipת�õõ�table
t:flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
t[;`iq]
t[2;]
t[2;`iq]
/ ��ά�����ݽṹ����һ��γ��ʹ������index���ڶ���γ��ʹ��symbol����
/ ָֻ����һ��γ�ȵ���������ʾ������Ƭ
/ ����ڶ�����������ʾ������
/ ����γ�ȶ�ָ������ʾ����Ԫ��
/ table��dictionary��ת�õ�Ψһ���þ���ת������γ��λ�ã��ײ����ݽṹû�з����仯
/ typeʹ����table�ϣ����ص�����ֵ��98h
type t
/ ֻ����table�У���ȡ�У�ָ���ڶ�������symbolʱ�򣬿���ʡ�Էֺ�
t[;`iq]
t[`iq]
t[`name`iq]
/ ����ʹ�õ������������ֵ��tableҲ���ԣ���������ں����ڲ��޷�ʹ�ã����Ƽ�ʹ��
t.name
dc
t
/ table�Ķ���ṹ 
/ ([] c1:L1; ...; cn:Ln)
/ c��symbol����ֵ����ʾ������L�Ƕ�Ӧ��list������ֵ�����е�L�ĳ�����ͬ��ǰ�淽���ţ���keyed table�а���key
/ ��Ҫʡ��table�еķ����ţ���������Ϊ����list������table
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
t~flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
c1:`Dent`Beeblebrox`Prefect
c2:98 42 126
([] c1; c2)
/ ���û����ȷ��ָ��������q��Ŭ���������ǣ�����ʹ�ñ�������
/ table�Ĵ���������ʹ����Ч��q���ʽ������ȷ�����н���еĳ�����ͬ
([] c1:1+til 5; c2:5#42)
/ �������ṩһ��ԭ�ӣ����Զ���չƥ��
([] c1:`a`b`c; c2:42; c3:98.6)
/ �����ڶ���single-row tableʱ�����е�column���ǵ�һatom��������һ��enlist
/ ([] c1:`a; c2:100) 
([] c1:enlist `a; c2:100)
`c1`c2`c3!(`a`b`c;42;1.1)
flip `c1`c2`c3!(`a`b`c;42;1.1)
/ ʹ��cols������������table����������
cols t
/ ʹ��meta����������table��metadata�������һ��keyed table��ÿ������һ����¼
/ keyed table��key column c�������������
/ column t�����е�����ֵ��ʹ��type char��ʾ
/ column f�������
/ column a�����������ӵ�����
/ ��type charΪ��д��ʱ����ʽ����б����ʽ������ʹ�þۺϲ���
meta ([] c1:1 2 3; c2:(1 2; enlist 3; 4 5 6))
/ meta�����ڴ��е�partition tableʱ��ֻ���õ�ǰ��partition��������һ���ٶ�����Ƭ��partition��������parition��һ�µ�
/ �����һ�£�֮�󿴵�kdb������
/ ����tables����һ�������ռ䣬���ض�Ӧ��table�������б�
t2:([] c1:1 2 3; c2:(1 2; enlist 3; 4 5 6))
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
tables `.
/ ����\a����ͬ���Ľ����û�в����ͷ��ص�ǰ���ݿռ�
/ ʹ��count����table�м�¼������
count t
t
t[0]
t[1]
/ index������table��Ƭ��dictionary������ֻ���ȡtable�е�columnֵ����Ҫcolumn���֣�ʹ�ú���value
value t[1]
/ �б��Ԫ�����ֵ�
/ type (`<em>name</em>`iq!(`Dent;98); `<em>name</em>`iq!(`Beeblebrox;42))
type (`name`iq!(`Dent;98); `name`iq!(`Beeblebrox;42))
/ ???
/ ���ʹ��enlist��������������ʱsimple dictionary�������table��
type enlist `a`b!10 20
/ �����������������Զ�ʶ������ʹ��ˣ������еļ����Ͳ��������Ч�ʣ����ֵ�Ԫ����ɵ�list
/ table���columns��ʱ��ĸ���Ч���ǣ�����row��ʱ���Ǻܰ���Ĳ�����Ϊ�˽������ѹ�����е�column list
/ ���õĽ�����������Ǵ�����иò�����ʹ��a separate column�����ӳٺ�Ҫɾ���еı��
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ С�����ʹ�������г��������ͨ��ʹ�ñ�����Ԫ�أ����߶��ļ����Ԫ��
/ ͨ������һ���ձ���ʼ��
([] name:(); iq:())
/ �ĸ�ʽ����һ����¼�������������ͣ�Ȼ����enlist������ȷ����֮�����ӣ�Ҫ����ƥ��
/ �Ƽ��Կձ�Ŀ��б�ָ������
([] name:`symbol$(); iq:`int$())
([] name:0#`; iq:0#0)
/ ����Ϊʲô����1b������֣�
([] name:0#`; iq:0#0)~ ([] name:`symbol$(); iq:`int$())
/ ����ʹ�����ַ�ʽ��ȷ������Ϊ��ȷ������
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ ������ѯ��ģ�壬select cols from table��table������������table��keyed table��cols֮��ʹ�ö��ŷָ�
/ SELECT * FROM table
/ ��q�в�ѯ�������ݵ�ʱ�򣬲���Ҫʹ��ͨ�����ֻҪ�������ʡ���������Ϳ��Եõ�ȫ��
/ select��from�����ܵ������֣�
select from t
/ ��ѯָ�����У�ʹ�ö��ŷָ�������ж��select��from֮�䣬���Զ������ض���
select name from t
select c1:name, c2:iq from t
/ update�ĸ�ʽ��select���ƣ�����
update iq:iq%100 from t
t
/ ��SQL�У���������һ�����߶������Ϊ�����������ζ���е�ֵ���������϶���Ψһ�ģ��ܹ������ͼ���ͨ��keyֵ
/ keyed table��dictionary�ṹ��keyֵ���valueֵ���ӳ���ϵ�������ÿ�к�ֵ���ÿ�����Ӧ
/ �ܹ�ͨ��primary key����lookup��λ���Ͻ���ƥ��
/ A keyed table is not a table �C it is a dictionary and so has type 99h.
/ keysӦ����Ψһ�ģ����ǲ���ǿ�Ƶģ���Ψһ�ļ�������ͨ��lookup���������ǿ���ʹ��select����
v:flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
/ ���eid����Ϊ��ʶ������Ϊkey column�����е�dictionary��ʹ��enlist�����������߲�����list
k:flip (enlist `eid)!enlist 1001 1002 1003
/ ȷ������table������
kt:k!v
kt
/ �������д��벻����q����̨һ���Դ�ӡ
kt:(flip (enlist `eid)!enlist 1001 1002 1003)!flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
kt:(flip (enlist `eid)!enlist 1001 1002 1003)!
 flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
/ ����keyed table��key colomn д�ڴ���tableʱ��Ŀշ�������
kt:([eid:1001 1002 1003]
 name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ �����keyed table��ʹ�ÿռ��б�Ϳ�ֵ�б�
ktempty:([eid:()] name:(); iq:())
/ָ��empty keyed table������
ktempty:([eid:`int$()] `symbol$name:(); iq:`int$())
ktempty:([eid:0#0] name:0#`; iq:0#0)
/ ��Ϊ���ر�ʾ�ֵ�ӳ�䣬����ͨ����ֵ��ȡֵ�������ֵ���һ����¼���ֵ����Ƭ
kt[(enlist `eid)!enlist 1002]
/ ����ֱ��д�����е�ֵ
kt[1002]
/ �������еĵ���Ԫ��
kt[1002][`iq]
/ ����ʹ��index at depth��ʽ����
kt[1002;`iq]
/ keyed table�������ǽ�table��index���ǵ������ǵ�ֵΪkey table�е�ÿ��ֵ
kt[1001]
/ kt[1001 1002]
/ ������¼�Ĵ��������ʽ
/ ��Ҫ����һ��list��listԪ�����ǵ���list��enlist��Ҫ���ҵ�keyֵ���з�װ
kt[(enlist 1001;enlist 1002)]
/ ��������table������table���ң��ҵ���Ӧ��value table
kt ([] eid:1001 1002)
/ #����ȡ��Ӧ���У�#ʽdictionary�ĳ�ȡ�����������������index����ȡ�ұ�dictionary��Ӧ������
([] eid:1001 1002)#kt
/ keyed table����Ҫselect
/ ��Ϊkeyed table��dictionary������ͨ��������ң�value����key
kts:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect)
/ ʹ������table��������Ӧ��value table����key table
kts?([] name:`Prefect`Dent)
/ ����ʹ�ú���key��value����ȡkeyed table�����
key kt
value kt
/ ����keys����key column�������б�
keys kt
/ ����cols�����������ر��������������
cols kt
/ ��̬��ת����������ı������ڲ�����Ǳ�ڵļ��У�ʹ�ö�Ԫ����xkeyת�ɶ�Ӧ��keyed table
/ xkey�ұ߲�������Դtable����keyed table����߲�����Ϊkey��������symbolֵ
/ ��������ǰ����x�������Ƕ�Ԫ��
t:([] eid:1001 1002 1003; name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
`eid xkey t
/ ��keyed tableת������table��ʹ��xkey��������߲���Ϊ���б�
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
kt
/ ����ʹ�����ع��Ĳ�����!���Ա���ӺͽӴ���������߲����ǣ�table�������Ҫ����������еĸ���
/ ��߲������еĸ����������е�index����������һ�У���Ϊ1�����ȡ����������Ϊ0
1!t
0!kt
/ ���ϵĲ����������ɸ���ֵ������ʹ��call-by-name��ԭʼ�����Ͻ����޸�
`eid xkey `t
() xkey `kt
kt
/ ���xkey���ܵ���������Ψһֵ�������Ϊ����������keyed table����������ȷ������
t:([] eid:1001 1002 1003 1001; name:`Dent`Beeblebrox`Prefect`Dup)
ktdup:`eid xkey t
ktdup
/ ������ͻ������ʹ��lookup��ͨ����ֵ���Ҷ�Ӧ��valueֵ���鲻ȫ��ֻ��ʾ��һ�γ��ֵ�ֵ
ktdup 1001
/ ����ͨ��select����ȫ��ֵ
select from ktdup where eid=1001
/ ����й��ɵ��������������ж�����У��÷ֺŷָ�
ktc:([lname:`Dent`Beeblebrox`Prefect; fname:`Arthur`Zaphod`Ford]; iq:98 42 126)
/ ͨ�����������еļ�¼������lookup����
ktc[`lname`fname!`Beeblebrox`Zaphod]
/ simple����ʡ��key��ֻдvalueֵ����Ϊkeyֵ����valueֵ
ktc[`Dent`Arthur]
/ ���б�Ĵ���
ktc:([lname:`symbol$();fname:`symbol$()] iq:`int$())
ktc:([lname:0#`;fname:0#`] iq:0#0)
/ flip��������������keyed table
ktc:(flip `lname`fname!(`Dent`Beeblebrox`Prefect;`Arthur`Zaphod`Ford))!flip (enlist `iq)!enlist 98 42 126
/ ͨ������������������¼����ͬ��simple key������ͨ������������list���Ҷ�Ӧ�Ķ����¼ֵ
ktc (`Dent`Arthur;`Prefect`Ford)
/ ����ͨ������table�������Ҷ�Ӧ��ֵ
ktc ([] lname:`Dent`Prefect; fname:`Arthur`Ford)
/ ����ʹ��#��������ȡsub keyed table
K:([] lname:`Dent`Prefect; fname:`Arthur`Ford)
K#ktc
/ keyed table��simple key��compound key
kts:([k:101 102 103] v1:`a`b`c; v2:1.1 2.2 3.3)
ktc:([k1:`a`b`c;k2:`x`y`z] v1:`a`b`c; v2:1.1 2.2 3.3)
/ ��������table������ֵ��
kts[([] k:101 103)]
ktc[([] k1:`a`c;k2:`x`z)]
/ �õ���table���ٸ���������ָ������value table�ж�Ӧ����
kts[([] k:101 103)][`v1]
ktc[([] k1:`a`c;k2:`x`z)][`v1`v2]
/ ����ʹ��index at depth��ʽ
kts[([] k:101 103); `v1]
ktc[([] k1:`a`c;k2:`x`z); `v1`v2]
/ �����ʾ���е�һ�е�ֵ��������һ�����������е�ֵ��ȷ�������֮��Ĺ���
/ q�е�����ṩ���������ԵĹ�ϵ��һ�е�ֵ�Ǵ���һ��Ψһֵ��ѡȡ�ģ�ö�ٵ����
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
([] eid:1003 1001 1002 1001 1002 1001; sc:126 36 92 39 98 42)
/ ȷ������е�ֵ����������һ��������������ƴӱ��������ö�٣���ʽ���ƣ�`kt$
/ q��ʹ��keyed table��ö���������ʱ���ܹ�֪����ʹ����key column�еļ�¼
`kt$1002 1001 1001 1003 1002 1003
/ ���ײ�����ֵǿת��longֵ���
`long$`kt$1002 1001 1001 1003 1002 1003
1003=`kt$1002 1001 1003 1002 1003
/ ������ö�������������ֵ���ᱨ��
/ `kt$1004
/ ö�����������ֵ��ͬ���ᱨ��
/ �ڴ���table��ʱ��ָ�����
tdetails:([] eid:`kt$1003 1001 1002 1001 1002 1001; sc:126 36 92 39 98 42)
/ ���������ʱ��ָ���˺�������֮��Ĺ�����ʹ��meta��f����ʾ������й�����������
meta tdetails
/ ���ú���fkeys����һ����Ϊ���������ظñ�������Ϣ
fkeys tdetails
/ �����Ҫ�����������и�Ϊ�����ǣ�ʹ��value������ö������
meta update value eid from tdetails
/ ��sql�У�join������ƴ�����ݣ�table�й�����ϵ�����������������ϵ��
/ q��ʹ�õ��������ֱ�ӵ��������Ӧ�������������
/ tf��һ�����������f�ı�ö�ٵ�keyed table��kt��kt�е������ж�����ʹ�õ����������select��ѯtf��
select eid.name, sc from tdetails
/ ����һ���������������Ӳ����������������Ҫָ������ָ��join
/ ��table��keyed table�ϵĲ���
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ ��table������¼�¼�����԰�table����list��ʹ��join�Ĳ�����,:
t,:`name`iq!(`W; 26)
t,:`iq`name!(200; `Albert)
t
/ ָ������������ֵ���Ӧ������֮���˳����Ի���
/ ��table�����һ�е�ʱ�򣬿���ʡ��������ָֻ��ֵ��������˳��Ҫ��
t,:(`H; 142)
/ t,:(97;`J)
t
/ ��Ϊtable���߼�����һЩ��¼��list�ṹ������ʹ��first��last��ȡ��ʼ�ͽ�β��¼
first t
last t
/ keyed table���ֵ䣬���Ժ���ֻ������value table��
first kt
last kt
/ ��Ϊtable��keyed table������ģ�ĳЩ�ۺϲ����ǲ���order by��ֱ��ʹ�ô���table��˳��
/ ǰn���ͺ�n����ȡ����ʹ��#����Ϊtable��list��keyed table��dictionary�����Զ���ʹ��#
2#t
-3#kt
/ find������ʹ��?������table�ϣ����ض�Ӧrecord��indexֵ
t?`name`iq!(`Dent;98)
/ ͨ������¼������д�ɸ���ֵ��list����ȷ�����ͺ�˳��
t?(`Dent;98)
/ �Ը���ѯ��ʹ��Ƕ��list
t?((`Dent;98);(`Prefect;126))
/ keyed table��dictionary������value���ҵ�һ�����ӵ�key record
kt?`name`iq!(`Dent;98)
kt?(`Dent;98)
/ ���еĳ��ң�����ʹ��enlist�����ߴ�������table
t1:([] eid:1001 1002 1003)
t1?enlist each 1001 1002
t1?([] eid:1001 1002)
/ ��ʵ����list��dictionary�Ĳ�����table��keyed table��Ӧ�ľ���list��dictionary
/ join����������,������ʹ���ڱ�ͼ��ر��У����Ǽ�¼���б��ϣ�SQL�е�union����
/ ʹ��,����������ǲ����������ƥ��
t,`name`iq!(`Slaartibartfast; `123)
/ ����һ��general list
t,(`Slaartibartfast; 110)
/ �������table��meta�����ȷƥ�䣬���Զ�����tableʹ�ö��Ų�������
t,([] name:1#`W; iq:1#26)
t,t
/ ����table��column��˳��ͬ������ʹ��join������,��q�е��е�˳�����������
/ t,([] name:1#`W; iq:1#26)
/ keyed tableһ��������metaֵһģһ��������ʹ��join
/ keyed table��dictionary������������table��table��record��list�ṹ
kt,([eid:1003 1004] name:`Prefect`W; iq:150 26)
/ coalesce�ϲ�����^����������keyed table������keyed table������ͬ���У�����Դ����dictionary
/ ��keyed table�У���ͬkey column����ͬ��Ӧ��ֵ���ұ߲���������߲���������Ϊnull��û�й�����Ӧ��key��������
([k:`a`b`c] v:10 0N 30)^([k:`a`b`c] v:100 200 0N)
([k:`a`b`c`x] v:10 0N 30 40)^([k:`a`b`c`y]; v:100 200 0N 0N)
/ ^������Ҫ��,������ΪҪ���ұ߲�������null���ж�
/ column join����ʹ������zip�Ĳ���,'�����߲���ʱ��ͬ��¼ֵ��table��ƽ�кϲ���Ӧ���е���
([] c1:`a`b`c),'([] c2:100 200 300)
/ �������table�е��в����⣬�ұߵĻḲ����ߵ�
([] c1:`a`b`c; c2:1 2 3),'([] c2:100 200 300)
/ ,'����������keyed table��ʱ������key column������һ�£�meta��ͬ���ٽ��ж�Ӧkey��zip����
([k:1 2 3] v1:10 20 30),'([k:3 4 5] v2:1000 2000 3000)
/ table�е�column list��Ϊ���ε�
tf:([] d:2015.01.01 2015.01.02; l:67.9 72.8; h:82.1 88.4)
tf 0
tf `l
tf `h
/ ��ֵ���ڵ�һ��list�У�ʹ��Ƕ��list
tp:([] d:2015.01.01 2015.01.02; lh:(67.9 82.10; 72.8 88.4))
tp 0
tp `lh
/ ����tuple�����Դ����������������в�ͬ�ĳ��ȣ���ͬ�����ͣ�ǿ����ֹ����Ϊ��kdb�У��������Ͳ��ܳ־û�
/ Ƕ�����е�����Ԫ�أ�����simple list������������ͬ����kdb���ر������� compound column������Ҫsimple����ͬ�ĳ���
tm:([] wk:2015.01.01 2015.01.08; rv:(38.92 67.34; 16.99 5.14 128.23 31.69))
tm
/ ��table�ĵ�����ʹ�ø���ֵ���ܹ�����ʹ�ñ��ʽ���и��Ӳ���
/ Nested columns mean adverbs. Lots of adverbs
select wk, srt:desc each rv, avgr:avg each rv, hi:max each rv from tm
/ ��������;ۺϣ�max��avg���Ǳ�׼��SQL��
/ ����compound column��ÿ��Ԫ�صĲ�ֵ
select wk, drp:neg 1_'deltas each desc each rv from tm
/ ���1_'��ʲô��˼����Ҳ�����ˣ�
ktc:([lname: `Dent`Beeblebrox`Prefect; fname:`Arthur`Zaphod`Ford]; iq:98 42 126)
tdetails:([] name:`ktc$(`Beeblebrox`Zaphod;`Prefect`Ford;`Beeblebrox`Zaphod); sc:36 126 42)
select name.lname, name.iq, sc from tdetails
([] name:`ktc$();sc:`long$())
ktc:([k1:1 2 3; k2:2001.01.01 2001.01.02 2001.01.03] v: 1. 2. 3.)
tfc:([] fk:`ktc$(); s:`symbol$())
tfc,:(`ktc$(1; 2001.01.01); `a)
/ ���������֮��Ĺ�����ǿ�����������ԣ����ֵ�������������е�ֵ
/ tfc,:(`ktc$(1; 2015.01.01); `a)
/ attributes����ֵ
/ attribute�Ǹ�����list�������ʽ����list��metadata��������dictionary��table�����ϣ�������ز�����
/ q�����������attribute��list���ж�Ӧ���Ż�
/ ������˵�������ǹ涨������ʶ�ǿ�������list�������ʽ��q���ټ��
/ q�����Լ�������Ҫ�Լ�������ʽ
/ ������ʽ��ʹ�����صĲ�����#����߲���ʱ�������Ե�symbolֵ���ұ�������Ŀ���б�
/ ����ֵ��ֱ���������б��ϣ�����������copyֵ
/ kx�У�����100�������ݣ�attributeûʲô���Ե��е㣬attribute�����Զ�����ӣ���ҪäĿ����������
/ �����������ԣ�ʹ��`s#������list�ϣ���ʾlist�е�Ԫ������������û�а취���彵��
/ ���������ڲ��ҵ�ʱ��ʹ�ö��ֲ��Ҵ������Բ��ң�find ?, equality =, in and within ��������
/ ����̨����ʾ��q�����Ƿ������ڸ�attribute
`s#1 2 4 8
/ `s#2 1 3 4
/ sort�������Զ���������ӵ����ֵ�ϣ���til����
asc 2 1 8 4
til 5
/ ʹ������޸Ĳ�����,:��֮�󣬻�Խ������list������ԣ������ȷ����������ȷ���Ƴ�
L:`s#1 2 3 4 5
L,:6
L
L,:0
L
/ һ��sorted���������õĵط�����ʱ������
t:([] ti:`s#00:00:00 00:00:01 00:00:03; v:98 98 100.)
meta t
/ �����sorted����������table�ϣ���һ����parted attribute
meta `s#([] ti:00:00:00 00:00:01 00:00:03; v:98 98 100.)
/ sorted������dictionary�ϣ����������ֵ��key list�ϣ�ʹ�ò��Ҹ��죬���ֲ��ң���������
d:`s#10 20 30 40 50!`a`b`c`d`e
key d
d 10
d 12
d 15
d 20
meta `s#([k:1 2 3 4] v:`d`c`b`a)
/ Uniqueʹ��`u#������list�ϣ�˵��ÿ���Ƕ��ǲ�ͬ�ģ�����ģ�disctinct������identity
/ `u#����ʵ���ϣ���q�д���hash table����ô���list����������ԣ�ֵ��unique�����Ҳ����޸ģ�ʹ��unique����
`u#2 1 4 8
/ q����Ψһ�ԣ����list��Ψһ������unique�ᱨ��
/ `u#2 1 4 8 2
/ ����ظ���ֵ���ᶪ��������
L:`u#2 1 4 8
L,:3
L
L,:2
L
/ Ψһ���ԣ��ܹ�������dictionary���������ϣ�table��column�ϣ�keyed table��key column��
/ ����ֱ��������dicionary��table��keyed table��
/ parted����`p#����list�е�ֵ�������ڵģ�parted����������simple list��������ֵֵ�ϣ�symbol��ö��������
/ parted�������qȥ�����ײ�����ݽṹ�Ǳ���ÿ���Ĳ�ֵ��list������֮�����Ҫ�����ԣ�
/ �������parted list���������е�ֵ���ǻ���ģ�ʹ��join����������,���ϲ�����parted
`p#2 2 2 1 1 4 4 4 4 3 3
/ ����sorted������unique
/ ��������
/ `p#2 2 2 1 1 4 4 4 4 3 3 2
/ `u#2 1 4 3 2
/ ����parted��list�������κβ���֮�󣬶�����ʧ����
L:`p#1 1 2 3 3
L
L,:3
L
/ grouped����`g#���������������list�ϣ���q�д���hash table
`g#1 2 3 2 3 4 3 4 5 2 3 4 5 4 3 5 6
L:`g#100?100
L
L,:1 1 1 1
L
/ ���������list�������������
/
/ ɾ�����Բ���ʹ�ã�`#���Ƴ�list��ǰ���κ�����ֵ
L:`s#til 10
L
`#L
/ �պ�400�У��Һ��ۣ�table���¶��Ǹ������ǰ�������߰��������࣬table����д�˺þã����һ�����ϵ�kdb��