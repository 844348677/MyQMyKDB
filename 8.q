/ 在q中table是一级实体，像list和dictionary一样的数据结构，存在在内存中
/ q中table的本质是列的集合，类似于dictionary，table是面向列的，dictionary是面向行的
/ q中table由有序列列表组成，使得kdb+效率高，检索和操作连续数据，一个例子是时间序列
/ kdb+的handle relational和时间序列数据，定义在q table中，没有分开的数据定义语言，没有分开的存储过程语言，不需要单独表示为了持久化
/ 只用q table，表达式和函数
/ table是由dictionary创建的
/ 可以将table看成 column dictionary，使用字典使用flip转置得到
dc:`name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
dc[`iq;]
dc[;2]
dc[`iq; 2]
/ 使用flip转置得到table
t:flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
t[;`iq]
t[2;]
t[2;`iq]
/ 二维的数据结构，第一个纬度使用整数index，第二个纬度使用symbol列名
/ 只指定第一个纬度的整数，显示数据切片
/ 定义第二个列名，显示整个列
/ 两个纬度都指定，显示单个元素
/ table是dictionary，转置的唯一作用就是转换两个纬度位置，底层数据结构没有发生变化
/ type使用在table上，返回的类型值是98h
type t
/ 只有在table中，抽取列，指定第二个参数symbol时候，可以省略分号
t[;`iq]
t[`iq]
t[`name`iq]
/ 可以使用点操作符来检索值，table也可以，点操作符在函数内部无法使用，不推荐使用
t.name
dc
t
/ table的定义结构 
/ ([] c1:L1; ...; cn:Ln)
/ c是symbol类型值，表示列名，L是对应的list保存列值，所有的L的长度相同，前面方括号，在keyed table中包含key
/ 不要省略table中的方括号，否则会解析为创建list而不是table
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
t~flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
c1:`Dent`Beeblebrox`Prefect
c2:98 42 126
([] c1; c2)
/ 如果没有明确的指明列名，q会努力创造他们，上面使用变量名，
/ table的创建，可以使用有效的q表达式，必须确定所有结果列的长度相同
([] c1:1+til 5; c2:5#42)
/ 在列中提供一个原子，会自动扩展匹配
([] c1:`a`b`c; c2:42; c3:98.6)
/ 不能在定义single-row table时，所有的column都是单一atom，至少有一个enlist
/ ([] c1:`a; c2:100) 
([] c1:enlist `a; c2:100)
`c1`c2`c3!(`a`b`c;42;1.1)
flip `c1`c2`c3!(`a`b`c;42;1.1)
/ 使用cols函数，来检索table的所有列名
cols t
/ 使用meta函数，检索table的metadata，结果是一个keyed table，每列生成一个记录
/ keyed table的key column c，包含表的列名
/ column t包含列的类型值，使用type char表示
/ column f包含外键
/ column a包含列所链接的属性
/ 当type char为大写的时候，列式混合列表的形式，不能使用聚合操作
meta ([] c1:1 2 3; c2:(1 2; enlist 3; 4 5 6))
/ meta，在内存中的partition table时，只作用当前的partition，做出了一个假定，分片的partition和其他的parition是一致的
/ 如果不一致，之后看到kdb再来吧
/ 函数tables接受一个命名空间，返回对应的table的名字列表，
t2:([] c1:1 2 3; c2:(1 2; enlist 3; 4 5 6))
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
tables `.
/ 命令\a返回同样的结果，没有参数就返回当前内容空间
/ 使用count返回table中记录的数量
count t
t
t[0]
t[1]
/ index检索的table切片是dictionary，所以只想获取table中的column值，不要column名字，使用函数value
value t[1]
/ 列表的元素是字典
/ type (`<em>name</em>`iq!(`Dent;98); `<em>name</em>`iq!(`Beeblebrox;42))
type (`name`iq!(`Dent;98); `name`iq!(`Beeblebrox;42))
/ ???
/ 如果使用enlist创建单例，参数时simple dictionary，结果是table，
type enlist `a`b!10 20
/ 如果不想进行这样的自动识别，那你就错了，关于列的检索和操作会更有效率，比字典元素组成的list
/ table存成columns的时候的负面效果是，产出row的时候是很昂贵的操作，为了结果集，压缩所有的column list
/ 做好的解决方法，就是大表不进行该操作，使用a separate column，来延迟后要删除列的标记
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ 小表可以使用文字列出来，大表通常使用编程添加元素，或者读文件添加元素
/ 通常创建一个空表，初始化
([] name:(); iq:())
/ 改格式，第一条记录可以是任意类型，然后变成enlist，类型确定，之后的添加，要类型匹配
/ 推荐对空表的空列表指定类型
([] name:`symbol$(); iq:`int$())
([] name:0#`; iq:0#0)
/ 下面为什么不是1b？好奇怪？
([] name:0#`; iq:0#0)~ ([] name:`symbol$(); iq:`int$())
/ 无论使用哪种方式，确保数据为正确的类型
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ 基础查询的模板，select cols from table，table可以是正常的table和keyed table，cols之间使用逗号分隔
/ SELECT * FROM table
/ 在q中查询所有数据的时候，不需要使用通配符，只要见到你的省略列名，就可以得到全部
/ select和from都不能单独出现，
select from t
/ 查询指定的列，使用逗号分隔列名，卸载select和from之间，可以对列名重定义
select name from t
select c1:name, c2:iq from t
/ update的格式和select相似，可以
update iq:iq%100 from t
t
/ 在SQL中，可以声明一个或者多个列作为表的主键，意味着列的值在作用域上都是唯一的，能够鉴定和检索通过key值
/ keyed table是dictionary结构，key值表和value值表的映射关系，键表的每行和值表的每行想对应
/ 能够通过primary key进行lookup，位置上进行匹配
/ A keyed table is not a table – it is a dictionary and so has type 99h.
/ keys应该是唯一的，但是不是强制的，不唯一的键，不能通过lookup操作，但是可以使用select操作
v:flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
/ 添加eid来作为标识符，作为key column，单行的dictionary，使用enlist创建左右两边参数的list
k:flip (enlist `eid)!enlist 1001 1002 1003
/ 确定两个table的链接
kt:k!v
kt
/ 下面这行代码不能在q控制台一次性打印
kt:(flip (enlist `eid)!enlist 1001 1002 1003)!flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
kt:(flip (enlist `eid)!enlist 1001 1002 1003)!
 flip `name`iq!(`Dent`Beeblebrox`Prefect;98 42 126)
/ 创建keyed table，key colomn 写在创建table时候的空方括号中
kt:([eid:1001 1002 1003]
 name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ 定义空keyed table，使用空键列表和空值列表
ktempty:([eid:()] name:(); iq:())
/指定empty keyed table的类型
ktempty:([eid:`int$()] `symbol$name:(); iq:`int$())
ktempty:([eid:0#0] name:0#`; iq:0#0)
/ 因为键控表示字典映射，可以通过键值获取值，键表和值表的一条记录是字典的切片
kt[(enlist `eid)!enlist 1002]
/ 可以直接写键表中的值
kt[1002]
/ 单个列中的单个元素
kt[1002][`iq]
/ 可以使用index at depth格式检索
kt[1002;`iq]
/ keyed table的作用是将table的index覆盖掉，覆盖的值为key table中的每行值
kt[1001]
/ kt[1001 1002]
/ 多条记录的错误检索方式
/ 需要创建一个list，list元素中是单例list，enlist对要查找的key值进行封装
kt[(enlist 1001;enlist 1002)]
/ 创建匿名table，来对table查找，找到对应的value table
kt ([] eid:1001 1002)
/ #来抽取对应的列，#式dictionary的抽取方法，根据左操作符index，抽取右边dictionary对应的内容
([] eid:1001 1002)#kt
/ keyed table不需要select
/ 因为keyed table是dictionary，可以通过反向查找，value查找key
kts:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect)
/ 使用匿名table，创建对应的value table，查key table
kts?([] name:`Prefect`Dent)
/ 可以使用函数key和value，抽取keyed table的组件
key kt
value kt
/ 函数keys返回key column的名字列表
keys kt
/ 函数cols返回整个键控表的所有列名集合
cols kt
/ 动态的转换，将规则的表，并且内部含有潜在的键列，使用二元函数xkey转成对应的keyed table
/ xkey右边参数，是源table或者keyed table，左边参数作为key的列名的symbol值
/ 函数名，前面是x，往往是二元的
t:([] eid:1001 1002 1003; name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
`eid xkey t
/ 将keyed table转成正规table，使用xkey函数，左边参数为空列表
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
kt
/ 可以使用重载过的操作符!，对表添加和接触主键，左边参数是，table最左边需要变成主键的列的个数
/ 左边参数是列的个数，不是列的index，如果最左边一列，则为1，如果取消主键，则为0
1!t
0!kt
/ 以上的操作都是生成复制值，可以使用call-by-name在原始数据上进行修改
`eid xkey `t
() xkey `kt
kt
/ 如果xkey接受的主键不是唯一值，结果不为错，正常生成keyed table，不含有正确的主键
t:([] eid:1001 1002 1003 1001; name:`Dent`Beeblebrox`Prefect`Dup)
ktdup:`eid xkey t
ktdup
/ 主键冲突，不能使用lookup，通过键值查找对应的value值，查不全，只显示第一次出现的值
ktdup 1001
/ 可以通过select查找全部值
select from ktdup where eid=1001
/ 混合列构成的主键，方括号中定义多列，用分号分割
ktc:([lname:`Dent`Beeblebrox`Prefect; fname:`Arthur`Zaphod`Ford]; iq:98 42 126)
/ 通过复合主键中的记录，进行lookup操作
ktc[`lname`fname!`Beeblebrox`Zaphod]
/ simple可以省略key，只写value值，作为key值查找value值
ktc[`Dent`Arthur]
/ 空列表的创建
ktc:([lname:`symbol$();fname:`symbol$()] iq:`int$())
ktc:([lname:0#`;fname:0#`] iq:0#0)
/ flip创建复合主键的keyed table
ktc:(flip `lname`fname!(`Dent`Beeblebrox`Prefect;`Arthur`Zaphod`Ford))!flip (enlist `iq)!enlist 98 42 126
/ 通过复合主键来检索记录，不同与simple key，可以通过符合主键的list查找对应的多个记录值
ktc (`Dent`Arthur;`Prefect`Ford)
/ 可以通过构建table，来查找对应的值
ktc ([] lname:`Dent`Prefect; fname:`Arthur`Ford)
/ 可以使用#方法，截取sub keyed table
K:([] lname:`Dent`Prefect; fname:`Arthur`Ford)
K#ktc
/ keyed table，simple key，compound key
kts:([k:101 102 103] v1:`a`b`c; v2:1.1 2.2 3.3)
ktc:([k1:`a`b`c;k2:`x`y`z] v1:`a`b`c; v2:1.1 2.2 3.3)
/ 构造匿名table，检索值列
kts[([] k:101 103)]
ktc[([] k1:`a`c;k2:`x`z)]
/ 得到的table，再根据列名，指定检索value table中对应的列
kts[([] k:101 103)][`v1]
ktc[([] k1:`a`c;k2:`x`z)][`v1`v2]
/ 可以使用index at depth格式
kts[([] k:101 103); `v1]
ktc[([] k1:`a`c;k2:`x`z); `v1`v2]
/ 外键表示表中的一列的值，都是另一个表中主键列的值，确定表与表之间的关联
/ q中的外键提供引用完整性的关系，一列的值是从另一列唯一值中选取的，枚举的情况
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
([] eid:1003 1001 1002 1001 1002 1001; sc:126 36 92 39 98 42)
/ 确定外键中的值，是来自另一个表的主键，类似从表的主键做枚举，格式类似，`kt$
/ q中使用keyed table做枚举作用域的时候，能够知道是使用其key column中的记录
`kt$1002 1001 1001 1003 1002 1003
/ 将底层索引值强转成long值输出
`long$`kt$1002 1001 1001 1003 1002 1003
1003=`kt$1002 1001 1003 1002 1003
/ 当存在枚举作用域以外的值，会报错
/ `kt$1004
/ 枚举主键以外的值，同样会报错
/ 在创建table的时候，指定外键
tdetails:([] eid:`kt$1003 1001 1002 1001 1002 1001; sc:126 36 92 39 98 42)
/ 创建外键的时候，指定了和主键表之间的关联，使用meta，f列显示了外键列关联了主键表
meta tdetails
/ 内置函数fkeys接受一个表为参数，返回该表的外键信息
fkeys tdetails
/ 如果需要解除外键，将列改为正常是，使用value作用在枚举类上
meta update value eid from tdetails
/ 在sql中，join被用作拼接数据，table有关联关系，外键和主键建立关系，
/ q中使用点操作符，直接调用外键对应的主键表的列名
/ tf是一个含有外键列f的表，枚举的keyed table是kt，kt中的所有列都可以使用点操作符，在select查询tf中
select eid.name, sc from tdetails
/ 这是一个隐含的左外链接操作，点操作，不需要指明额外指明join
/ 在table和keyed table上的操作
t:([] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
kt:([eid:1001 1002 1003] name:`Dent`Beeblebrox`Prefect; iq:98 42 126)
/ 在table中添加新记录，可以把table看做list，使用join的操作符,:
t,:`name`iq!(`W; 26)
t,:`iq`name!(200; `Albert)
t
/ 指定的列名和列值相对应，列名之间的顺序可以混乱
/ 在table中添加一行的时候，可以省略列名，只指定值，但是有顺序要求
t,:(`H; 142)
/ t,:(97;`J)
t
/ 因为table在逻辑上是一些记录的list结构，可以使用first和last获取开始和结尾记录
first t
last t
/ keyed table是字典，所以函数只作用在value table上
first kt
last kt
/ 因为table和keyed table是有序的，某些聚合操作是不用order by，直接使用创建table的顺序
/ 前n个和后n个截取操作使用#，因为table是list二keyed table是dictionary，所以都能使用#
2#t
-3#kt
/ find操作符使用?作用在table上，返回对应record的index值
t?`name`iq!(`Dent;98)
/ 通常，记录可以缩写成该行值的list，正确的类型和顺序
t?(`Dent;98)
/ 对个查询，使用嵌套list
t?((`Dent;98);(`Prefect;126))
/ keyed table是dictionary，根据value查找第一个链接的key record
kt?`name`iq!(`Dent;98)
kt?(`Dent;98)
/ 单列的超找，必须使用enlist，或者创建匿名table
t1:([] eid:1001 1002 1003)
t1?enlist each 1001 1002
t1?([] eid:1001 1002)
/ 其实就是list和dictionary的操作，table和keyed table对应的就是list和dictionary
/ join操作符逗号,被定义使用在表和键控表中，都是记录的列表集合，SQL中的union操作
/ 使用,添加至，但是不会进行类型匹配
t,`name`iq!(`Slaartibartfast; `123)
/ 生成一个general list
t,(`Slaartibartfast; 110)
/ 如果两个table的meta结果精确匹配，可以对两个table使用逗号操作符，
t,([] name:1#`W; iq:1#26)
t,t
/ 两个table的column的顺序不同，不能使用join操作符,，q中的列的顺序是有意义的
/ t,([] name:1#`W; iq:1#26)
/ keyed table一样，两个meta值一模一样，可以使用join
/ keyed table是dictionary，左右两边是table，table是record的list结构
kt,([eid:1003 1004] name:`Prefect`W; iq:150 26)
/ coalesce合并操作^作用在两个keyed table，两个keyed table包含相同的列，操作源自于dictionary
/ 在keyed table中，相同key column中相同对应的值，右边参数覆盖左边参数，除非为null，没有公共对应的key，都保留
([k:`a`b`c] v:10 0N 30)^([k:`a`b`c] v:100 200 0N)
([k:`a`b`c`x] v:10 0N 30 40)^([k:`a`b`c`y]; v:100 200 0N 0N)
/ ^操作，要比,慢，因为要多右边参数进行null的判断
/ column join操作使用类似zip的操作,'，两边参数时相同记录值的table，平行合并对应其中的列
([] c1:`a`b`c),'([] c2:100 200 300)
/ 如果两个table中的列不互斥，右边的会覆盖左边的
([] c1:`a`b`c; c2:1 2 3),'([] c2:100 200 300)
/ ,'作用在两个keyed table的时候，两个key column不必须一致，meta相同，再进行对应key的zip操作
([k:1 2 3] v1:10 20 30),'([k:3 4 5] v2:1000 2000 3000)
/ table中的column list不为矩形的
tf:([] d:2015.01.01 2015.01.02; l:67.9 72.8; h:82.1 88.4)
tf 0
tf `l
tf `h
/ 将值存在单一的list中，使用嵌套list
tp:([] d:2015.01.01 2015.01.02; lh:(67.9 82.10; 72.8 88.4))
tp 0
tp `lh
/ 类似tuple，可以存任意数量，可以有不同的长度，不同的类型，强力禁止，因为在kdb中，这种类型不能持久化
/ 嵌套列中的所有元素，都是simple list，而且类型相同，在kdb中特别处理，叫做 compound column，不需要simple有相同的长度
tm:([] wk:2015.01.01 2015.01.08; rv:(38.92 67.34; 16.99 5.14 128.23 31.69))
tm
/ 在table的单列中使用复杂值，能够运行使用表达式进行复杂操作
/ Nested columns mean adverbs. Lots of adverbs
select wk, srt:desc each rv, avgr:avg each rv, hi:max each rv from tm
/ 例如排序和聚合，max和avg都是标准的SQL，
/ 计算compound column中每个元素的差值
select wk, drp:neg 1_'deltas each desc each rv from tm
/ 这个1_'是什么意思，我也忘记了？
ktc:([lname: `Dent`Beeblebrox`Prefect; fname:`Arthur`Zaphod`Ford]; iq:98 42 126)
tdetails:([] name:`ktc$(`Beeblebrox`Zaphod;`Prefect`Ford;`Beeblebrox`Zaphod); sc:36 126 42)
select name.lname, name.iq, sc from tdetails
([] name:`ktc$();sc:`long$())
ktc:([k1:1 2 3; k2:2001.01.01 2001.01.02 2001.01.03] v: 1. 2. 3.)
tfc:([] fk:`ktc$(); s:`symbol$())
tfc,:(`ktc$(1; 2001.01.01); `a)
/ 外键和主键之间的关联，强制引用完整性，外键值，必须是主键中的值
/ tfc,:(`ktc$(1; 2015.01.01); `a)
/ attributes属性值
/ attribute是附加在list的特殊格式，是list的metadata，能用在dictionary和table的列上，加速相关操作，
/ q解释器会对有attribute的list进行对应的优化
/ 属性是说明而不是规定，这意识是可以申明list的特殊格式，q会再检测
/ q不会自己做，需要自己声明格式
/ 声明格式，使用重载的操作符#，左边参数时特殊属性的symbol值，右边属性是目标列表
/ 属性值，直接作用在列表上，而不是生成copy值
/ kx中，少于100万条数据，attribute没什么明显的有点，attribute不是自动的添加，不要盲目的申请属性
/ 申请排序属性，使用`s#作用在list上，表示list中的元素是升序排序，没有办法定义降序，
/ 排序属性在查找的时候使用二分查找代替线性查找，find ?, equality =, in and within 操作更快
/ 控制台会显示，q会检测是否是属于该attribute
`s#1 2 4 8
/ `s#2 1 3 4
/ sort函数会自动将属性添加到结果值上，而til不会
asc 2 1 8 4
til 5
/ 使用添加修改操作符,:，之后，会对结果进行list检测属性，如果正确则保留，不正确则移除
L:`s#1 2 3 4 5
L,:6
L
L,:0
L
/ 一个sorted的属性作用的地方，是时间序列
t:([] ti:`s#00:00:00 00:00:01 00:00:03; v:98 98 100.)
meta t
/ 如果将sorted属性声明在table上，第一列是parted attribute
meta `s#([] ti:00:00:00 00:00:01 00:00:03; v:98 98 100.)
/ sorted声明在dictionary上，会作用在字典的key list上，使得查找更快，二分查找，副作用是
d:`s#10 20 30 40 50!`a`b`c`d`e
key d
d 10
d 12
d 15
d 20
meta `s#([k:1 2 3 4] v:`d`c`b`a)
/ Unique使用`u#作用在list上，说明每个是都是不同的，互斥的，disctinct函数，identity
/ `u#属性实质上，在q中创建hash table，最好创建list就申请该属性，值是unique，而且不长修改，使用unique属性
`u#2 1 4 8
/ q会检测唯一性，如果list不唯一，申请unique会报错
/ `u#2 1 4 8 2
/ 添加重复的值，会丢掉该属性
L:`u#2 1 4 8
L,:3
L
L,:2
L
/ 唯一属性，能过作用在dictionary的作用域上，table的column上，keyed table的key column上
/ 不能直接作用在dicionary，table和keyed table上
/ parted属性`p#表明list中的值都是相邻的，parted属性作用在simple list，任意数值值上，symbol的枚举类型上
/ parted属性造成q去创建底层的数据结构是保存每步的差值，list创建完之后才需要该属性，
/ 如果两个parted list，并且其中的值都是互斥的，使用join操作符逗号,，合并后还是parted
`p#2 2 2 1 1 4 4 4 4 3 3
/ 不是sorted，不是unique
/ 报错类型
/ `p#2 2 2 1 1 4 4 4 4 3 3 2
/ `u#2 1 4 3 2
/ 具有parted的list，进行任何操作之后，都会损失属性
L:`p#1 1 2 3 3
L
L,:3
L
/ grouped属性`g#可以作用在任意的list上，在q中创建hash table
`g#1 2 3 2 3 4 3 4 5 2 3 4 5 4 3 5 6
L:`g#100?100
L
L,:1 1 1 1
L
/ 最好在整个list创建后添加属性
/
/ 删除属性操作使用，`#，移除list当前的任何属性值
L:`s#til 10
L
`#L
/ 刚好400行，我好累，table这章都是概念，而且前两天乱七八糟的事情多，table这章写了好久，坚持一下马上到kdb了