
--Question 1 :
-- This query will return all the persons having most connections in the network.

select person from (select person , dense_rank() over (order by connections desc) as rnk from (select a.person_1 as person, count(a.person_2) as connections from social_network a  
group by a.person_1) ) where rnk = 1     ;


-- If we want any one of the person having most connections than we can use following query.(this is oracle specific syntax , for postgres we can use limit)

select person from (select a.person_1 as person, count(a.person_2) as connections from social_network a  
group by a.person_1 order by connections desc ) where rownum = 1    ;

--Question 2

—- This query will return all the person having most common connections with any other member , amongst all possible member-pair.
—- In this also if we want only one person then we can use rownum and order by in oracle or limit in postgres.

select substr(member_pair , 0,instr(member_pair , '-',1) - 1) as Person from (select member_pair , dense_rank() over (order by mutual_friends desc) as rnk from (select a.person_1 || '-' || b.person_1 as Member_Pair , count(*)  as mutual_friends  from social_network a , social_network b where a.person_1 <> b.person_1 
and a.person_2 = b.person_2 group by a.person_1 || '-' || b.person_1 )) where rnk = 1  ;

--question3 

select a.person_1 || '-' || b.person_1 as Member_Pair , count(*)  as mutual_friends  from social_network a , social_network b where a.person_1 <> b.person_1 
and a.person_2 = b.person_2  group by a.person_1 || '-' || b.person_1 order by   member_pair  ;
 
--Above query will display all the possible combination (e.g the pairs obama-sasha , sasha-obama will be treated different ) to display only the unique pairs we can use the below query. The query will work when (a.user_id * b.user_id) is unique for every pair.

select person|| '-' || friend as Member_Pair , count(*)  as mutual_connections from 
(select a.person_1 as Person , b.person_1 as Friend , b.person_2 as Mutual_Friend ,  row_number() over (partition by (a.user_id * b.user_id) , a.person_2 order by a.user_id ) as ord    from social_network a , social_network b where a.person_1 <> b.person_1 
and a.person_2 = b.person_2) x where ord = 1  group by person||'-' || friend order by mutual_connections desc ;


