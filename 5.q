/ �ֵ�������key list��value list��ӳ���ϵ�������б�����ͬ��key list����Ψһ������dictionary��key��simple list
/ dictionaryʹ�ø�̾��!����������Ϊkey list���ұ�Ϊvalue list
/ �ֵ��������99h
10 20 30!1.1 2.2 3.3
`a`b`c!100 200 300
/ keyû��ǿ�ƹ涨��simple list
(`Arthur`Dent; `Zaphod`Beeblebrox; `Ford`Prefect)! 100 42 150
1001 1002 1003!(`Arthur`Dent; `Zaphod`Beeblebrox; `Ford`Prefect)
/ �ֵ����ͨ��key��value��������key��value���б�
d:`a`b`c!100 200 300
key d
value d
count d
/ dictionaryû��ǿ��key�б��Ψһ�ԣ����ҵ�ʱ��ֻ�����ڵ�һ��key
/ ���keyΪuniqueʱ��ʹ��`u#��key������ԣ�ʹ���ֵ���hash table�����Ӳ�ѯС·���Ա�linear lookup
(`u#`a`b`c)!10 20 30
/ ��˳��Ԫ��˳��ͬ��dictionary���ж�identityʱ��Ψһ
(`a`b`c!10 20 30)~`a`c`b!10 30 20
/ ��dictionary�͵���dictionary
/ bang������list
()!()
/ ָ����list������
(`symbol$())!`float$()
/ ��������dictionary��ʹ�õ���list��enlist��������list������ֱ��bangԪ�أ�����
(enlist `x)!enlist 42
/ `x!42
/ look up�ҵ���Ӧkey��valueֵ������ʹ������index�ķ����ţ�Ҳ����ʡ�����Ų���д
d:`a`b`c!10 20 30
d[`a]
d `b
/ ���keyֵ������key�б��ֵ���򷵻�nullֵ������Ϊvalue list��Ӧ������
d[`x]
/ ������index��ָ����Ҫ��ѯ��key list
d[`a`c]
ks:`a`c
d ks
/ ͨ��ֵ�����Ҷ�Ӧ��key�����value list����û��Ҫ���ҵ�ֵ���򷵻�null������key
10 20 30 10 40?10
d:`a`b`c`a!10 20 30 10
d?10
d:`a`b`c`a!10 20 30 10
d?40
L:10 20 30
d:0 1 2!10 20 30
L 0
d 0
L 1 2
d 1 2
d~L
/ �ֵ���б�Ĳ�ͬ�����ֵ����ͨ����ֵ����չ
/ dictionary������ϡ���keyֵ
d1:0 100 500000!10 20 30 
d2:0 99 1000000!100 200 300
d1+d2
/ non-unique key�ڲ��ҵ�ʱ����ʾ��һ��������λ��
ddup:`a`b`a`c!10 20 30 20
ddup[`a]
ddup?30
ddup?20
/ ��Ҫ�������е�keyֵ��ʹ��where
where 10=d
where 20=ddup
/ key��value���Բ���simple list��������nested list
d:(`a`b; `c`d`e; enlist `f)!10 20 30
d `f
d?20
d:`a`b`c!(10 20; 30 40 50; enlist 60)
d?30 40 50
d?enlist 60
dwhackey:(1 2; 3 4 5; 6; 7 8)!10 20 30 40 / atom 6 is whack
dwhackey 1 2
dwhackey 6
dwhackval:10 20 30 40!(1 2; 3 4 5; 6; 7 8) / atom 6 is whack
dwhackval?3 4 5
dwhackval?6
/ ��ͬ��״�Ĳ��ҳ�������
/ dictionary����ͨ��key���޸�value��ֵ
d:`a`b`c!10 20 30
d[`b]:42
d
/ ��list��ͬ��dictionary����ͨ����ֵ����չ����˼��keyֵ���µ�
d:`a`b`c!10 20 30
d[`x]:42
d
/ d[k]:v����k�������޸����е�ֵ��key����������չd������upsert
d:`a`b`c!10 20 30
d[`b]:42 / update
d[`x]:100 / insert
d
/ table��keyed table����dictionary������kdb+����ʹ��upsert
/ ʹ��#���������������list����Դ�ֵ��г�ȡ��Ӧkey�����ֵ䣬��߲���ҪΪlist
d:`a`b`c!10 20 30
d `a`c
`a`c#d
(enlist `c)#d
/ ������ظ��ļ�����ѡȡ��һ��
ddup:`a`b`a`c!10 20 30 20
`a`c#ddup
dns:(`arthur`dent; `ford`prefect; `zaphod`beebelbrox)!100 150 42
(`arthur`dent; `zaphod`beebelbrox)#dns
/ ɾ��Ԫ�أ�ʹ���»��߲�����_�����ΪҪɾ���ļ����б��ұ����ֵ䣬ע���»���ǰ��Ҫ�пո����
d:`a`b`c!10 20 30
`a`c _ d
(enlist `b) _ d
/ ���Ҫɾ����key�У��в����ڵģ�û���κη�Ӧ
d:`a`b`c`a!10 20 30 40
`a`c _ d
`x`a _ d
/ ɾ���ֵ��е����м�ֵ�ԣ��õ����ֵ䣬����ʹ��-3!ǿ�ƴ�ӡ������̨
d:`a`b`c!10 20 30
`a`b`c _ d
-3!`a`b`c _ d
/ �����Ʋ�����cut�𵽺��»���ͬ��������
/ �»��ߵ����ط�������߲���ʱdictionary���ұ߲���ʱ����keyֵ��ɾ���ֵ��еļ�ֵ
/ ���ֵ�ʹ�û���������������key����������������valueֵ�ϣ������µ�dictionary
/ һԪ���������Դ�������dictionary�е�valueֵ�ϣ�neg����d�е�����valueֵ���为ֵ
d:`a`b`c!10 20 30
neg d
2*d
d=20
f:{x*x}
f d
/ ���ֵ������key list��identity��ʱ����ͬ��key��Ӧ������valueִֵ�в���������
d1:`a`b`c!1 2 3
d2:`a`b`c!10 20 30
d1+d2
/ ���key�б���identity�������keyû��ƥ������һ���ֵ��У��������κβ�����ֻ�ϲ�
d1:`a`b`c!1 2 3
d2:`b`c`d!20 30 40
d1+d2
/ join������ʹ�ö��ţ������key�Ͷ�Ӧ��ֵȫ����������
d1:`a`b`c!10 20 30
d2:`x`y!40 50
d1,d2
/ �����⣬��ͬ��keyֵ���ұ��ֵ��ֵ��������ֵ��ֵ
d1:`a`b`c!10 20 30
d2:`a`b`c!100 200 300
d1,d2
d1:`a`b`c!10 20 30
d2:`c`d!300 400
d1,d2
/ �൱�ڶ�����ֵ�����������ұ߲�����upsert����
d1:`a`b`c!10 20 30
d1[`c]:300
d1[`d]:400
d1
/ �Դ˶�����dictionary����join��������˳��ģ�˳��ͬ�����ɵ���dictionaryҲ��ͬ
d1:`a`b`c!10 20 30
d2:`c`d!300 400
d1,d2
d2,d1
/ coalesceʹ�ò�����^���ϲ�����dictionary����Ӧ�����ұ߲�����ֵ������ߵģ������ұ�ֵΪnull
d1:`a`b`c!10 0N 30
d2:`b`c`d!200 0N 400
d1^d2
d1:`a`b`c!10 20 30
d2:`b`c`d!200 300 400
d1+d2
/ ��ȺͱȽϲ�����������ͬkeyֵ�Ͻ��ж�Ӧ�Ĳ���
/ ������ڻ��������û��keyֵ���ֵ䣬��valueֵΪ����Ϊnull���ٽ��бȽϣ�
/ ���仰˵�������key��valueֵ��nullֵ�����в���
(`a`b`c!10 20 30)=`b`c`d!20 300 400
(`a`b`c!0N 20 30)=`b`c`d!20 300 0N
(`a`b`c!10 20 30)<`b`c`d!20 300 400
/ ���dictionary��key��symbol list��value�Ǿ���list��������
`c1`c2!(`a`b`c; 10 20 30)
/ c1...cn!(v1;...;vn) column dictionary
travelers:`name`iq!(`Dent`Beeblebrox`Prefect;42 98 126)
travelers
/ ��ȡkeyֵ��ȡ��Ӧ��valueֵ
travelers[`name]
/ �ٸ���list��index��ȡ��Ӧλ�õ�ֵ
travelers[`name][1]
travelers[`iq][2]
/ ʹ��һ�������źͷֺţ�index at depth��ʽ
/ column dictionary������Ϊ��һ����ά���ݽṹ
travelers[`name; 1]
travelers[`iq; 2]
/ ���齫column dictionary��Ϊ��ά���ݽṹ��������column name��column position
/ ��index��ʱ�����õڶ��������е�λ�ã����������������򷵻�������Ƭ
travelers[; 2]
/ column dictionary���Ա���Ϊ��ά���ݽṹ����һγ����symbol name���ڶ�λγ����column position
/ ���ֻ��һ��column������ֱ��ͨ���ڶ���γ�Ȼ�ȡ
/ ��ָ��column name��ʱ�򣬿��Ի�ȡ������Ƭ
/ ֻ��һ�е�column dictionary���ֵ����������б���ɣ�����Ҫ�õ������б�enlist
dc1:(enlist `c)!enlist 10 20 30
dc1
/ ����Ĺ��췽��
/ `c!1 2 3
/ ���Զ�Ƕ��ѭ������ת��
L:(10 20 30; 100 200 300)
L
flip L
/ ������nested list�ϣ���ת���к���������ֵ
L:(10 20 30; 100 200 300)
M:flip L
L[0;0]
L[0;1]
L[0;2]
M[0;0]
M[1;0]
M[2;0]
/ ת��flip�����ھ��Σ�column dictionary�ϣ���Ϊÿ�еĳ�����ͬ����������dictionary��
`c1`c2!(`a`b`c; 10 20 30)
/ ���ԶԾ������ݽṹ����ת��
dc:`c1`c2!(`a`b`c; 10 20 30)
dc
t:flip dc
t
/ ��������ֵ��λ�ý��з�ת
dc[`c1; 0]
dc[`c1; 1]
dc[`c1; 2]
t[0; `c1]
t[1; `c1]
t[2; `c1]
dc[`c1;]
t[;`c1]
dc[; 0]
t[0;]
dc[`c2; 1]
t[1; `c2]
t[;`c1]
t[0;]
t[1; `c2]
/ ��table��ȡ������Ƭ�����������һ������λ�ã��Ϳ����ˣ����ڶ�������column nameΪ��ʱ�ֺ��ǿ���ʡ�Ե�
t[0]
t[1]
t[2]
/ ת����ת�õõ�ԭ����dictionary
dc~flip flip dc
dc~flip t
/ flip column dictionary���ײ����������洢�ṹ�������仯
