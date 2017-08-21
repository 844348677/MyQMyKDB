/ 字典类型是key list到value list的映射关系，两个列表长度相同，key list尽量唯一，多数dictionary的key是simple list
/ dictionary使用感叹号!创建，做边为key list，右边为value list
/ 字典的类型是99h
10 20 30!1.1 2.2 3.3
`a`b`c!100 200 300
/ key没有强制规定是simple list
(`Arthur`Dent; `Zaphod`Beeblebrox; `Ford`Prefect)! 100 42 150
1001 1002 1003!(`Arthur`Dent; `Zaphod`Beeblebrox; `Ford`Prefect)
/ 字典可以通关key和value函数抽离key和value的列表
d:`a`b`c!100 200 300
key d
value d
count d
/ dictionary没有强制key列表的唯一性，查找的时候只发生在第一个key
/ 如果key为unique时，使用`u#对key添加属性，使得字典编程hash table，增加查询小路，对比linear lookup
(`u#`a`b`c)!10 20 30
/ 有顺序，元素顺序不同的dictionary，判断identity时不唯一
(`a`b`c!10 20 30)~`a`c`b!10 30 20
/ 空dictionary和单例dictionary
/ bang两个空list
()!()
/ 指定空list的类型
(`symbol$())!`float$()
/ 创建单例dictionary，使用单例list，enlist创建两个list，不是直接bang元素，出错
(enlist `x)!enlist 42
/ `x!42
/ look up找到对应key的value值，可以使用类似index的方括号，也可以省略括号并列写
d:`a`b`c!10 20 30
d[`a]
d `b
/ 如果key值传不在key列表的值，则返回null值，类型为value list对应的类型
d[`x]
/ 可以在index中指定需要查询的key list
d[`a`c]
ks:`a`c
d ks
/ 通过值来查找对应的key，如果value list里面没有要查找的值，则返回null，根据key
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
/ 字典和列表的不同，是字典可以通过赋值来扩展
/ dictionary可以有稀疏的key值
d1:0 100 500000!10 20 30 
d2:0 99 1000000!100 200 300
d1+d2
/ non-unique key在查找的时候，显示第一个发生的位置
ddup:`a`b`a`c!10 20 30 20
ddup[`a]
ddup?30
ddup?20
/ 想要查找所有的key值，使用where
where 10=d
where 20=ddup
/ key和value可以不是simple list，甚至是nested list
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
/ 不同形状的查找出错问题
/ dictionary可以通过key来修改value的值
d:`a`b`c!10 20 30
d[`b]:42
d
/ 与list不同，dictionary可以通过赋值来扩展，意思是key值是新的
d:`a`b`c!10 20 30
d[`x]:42
d
/ d[k]:v，当k存在则修改其中的值，key不存在则扩展d，类似upsert
d:`a`b`c!10 20 30
d[`b]:42 / update
d[`x]:100 / insert
d
/ table和keyed table都是dictionary，所以kdb+中能使用upsert
/ 使用#操作符，根据左边list，从源字典中抽取对应key的子字典，左边参数要为list
d:`a`b`c!10 20 30
d `a`c
`a`c#d
(enlist `c)#d
/ 如果有重复的键，测选取第一个
ddup:`a`b`a`c!10 20 30 20
`a`c#ddup
dns:(`arthur`dent; `ford`prefect; `zaphod`beebelbrox)!100 150 42
(`arthur`dent; `zaphod`beebelbrox)#dns
/ 删除元素，使用下划线操作符_，左边为要删除的键的列表，右边有字典，注意下划线前后要有空格隔开
d:`a`b`c!10 20 30
`a`c _ d
(enlist `b) _ d
/ 如果要删除的key中，有不存在的，没有任何反应
d:`a`b`c`a!10 20 30 40
`a`c _ d
`x`a _ d
/ 删除字典中的所有键值对，得到空字典，可以使用-3!强制打印到控制台
d:`a`b`c!10 20 30
`a`b`c _ d
-3!`a`b`c _ d
/ 二进制操作符cut起到和下划线同样的作用
/ 下划线的重载方法，左边参数时dictionary，右边参数时单个key值，删除字典中的键值
/ 对字典使用基础操作符，根据key，将操作符作用在value值上，生成新的dictionary
/ 一元操作符，以此作用在dictionary中的value值上，neg，对d中的所有value值求其负值
d:`a`b`c!10 20 30
neg d
2*d
d=20
f:{x*x}
f d
/ 当字典的两个key list是identity的时候，相同的key对应的两个value值执行操作符函数
d1:`a`b`c!1 2 3
d2:`a`b`c!10 20 30
d1+d2
/ 如果key列表不是identity，多余的key没有匹配在另一个字典中，不进行任何操作，只合并
d1:`a`b`c!1 2 3
d2:`b`c`d!20 30 40
d1+d2
/ join操作符使用逗号，互斥的key和对应的值全部保留下来
d1:`a`b`c!10 20 30
d2:`x`y!40 50
d1,d2
/ 不互斥，相同的key值，右边字典的值覆盖左边字典的值
d1:`a`b`c!10 20 30
d2:`a`b`c!100 200 300
d1,d2
d1:`a`b`c!10 20 30
d2:`c`d!300 400
d1,d2
/ 相当于对左边字典参数，进行右边参数的upsert操作
d1:`a`b`c!10 20 30
d1[`c]:300
d1[`d]:400
d1
/ 以此对两个dictionary进行join操作是有顺序的，顺序不同，生成的新dictionary也不同
d1:`a`b`c!10 20 30
d2:`c`d!300 400
d1,d2
d2,d1
/ coalesce使用操作符^，合并两个dictionary，对应键上右边参数的值覆盖左边的，除非右边值为null
d1:`a`b`c!10 0N 30
d2:`b`c`d!200 0N 400
d1^d2
d1:`a`b`c!10 20 30
d2:`b`c`d!200 300 400
d1+d2
/ 相等和比较操作符，在相同key值上进行对应的操作
/ 如果存在互斥键，则没有key值得字典，该value值为设置为null，再进行比较，
/ 换句话说，多余的key的value值和null值，进行操作
(`a`b`c!10 20 30)=`b`c`d!20 300 400
(`a`b`c!0N 20 30)=`b`c`d!20 300 0N
(`a`b`c!10 20 30)<`b`c`d!20 300 400
/ 如果dictionary的key是symbol list，value是矩形list，很有用
`c1`c2!(`a`b`c; 10 20 30)
/ c1...cn!(v1;...;vn) column dictionary
travelers:`name`iq!(`Dent`Beeblebrox`Prefect;42 98 126)
travelers
/ 获取key值获取对应的value值
travelers[`name]
/ 再根据list的index获取对应位置的值
travelers[`name][1]
travelers[`iq][2]
/ 使用一个方括号和分号，index at depth格式
/ column dictionary可以认为是一个二维数据结构
travelers[`name; 1]
travelers[`iq; 2]
/ 建议将column dictionary视为二维数据结构，索引是column name和column position
/ 在index的时候，设置第二个参数列的位置，而不设置列名，则返回数据切片
travelers[; 2]
/ column dictionary可以被视为二维数据结构，第一纬度是symbol name，第二位纬度是column position
/ 如果只有一个column，可以直接通过第二个纬度获取
/ 不指定column name的时候，可以获取数据切片
/ 只有一列的column dictionary，字典是由两个列表组成，所以要用到单例列表，enlist
dc1:(enlist `c)!enlist 10 20 30
dc1
/ 错误的构造方法
/ `c!1 2 3
/ 可以对嵌套循环进行转置
L:(10 20 30; 100 200 300)
L
flip L
/ 作用在nested list上，翻转了行和列上索引值
L:(10 20 30; 100 200 300)
M:flip L
L[0;0]
L[0;1]
L[0;2]
M[0;0]
M[1;0]
M[2;0]
/ 转置flip能用在矩形，column dictionary上，因为每列的长度相同，不能用在dictionary上
`c1`c2!(`a`b`c; 10 20 30)
/ 可以对矩形数据结构进行转置
dc:`c1`c2!(`a`b`c; 10 20 30)
dc
t:flip dc
t
/ 两个索引值的位置进行翻转
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
/ 对table获取数据切片，仅仅传入第一个索引位置，就可以了，当第二个索引column name为空时分号是可以省略的
t[0]
t[1]
t[2]
/ 转置再转置得到原来的dictionary
dc~flip flip dc
dc~flip t
/ flip column dictionary，底层的数据物理存储结构不发生变化
