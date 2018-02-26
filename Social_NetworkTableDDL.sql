create table social_network (
    Row_Id number not null constraint social_network_pk primary key,
    User_Id number not null ,
    Person_1 varchar2(4000) not null,
    Person_2 varchar2(4000) not null
);

INSERT INTO social_network VALUES(1,1, 'Barack Obama', 'Michelle Obama');
INSERT INTO social_network VALUES(2,1, 'Barack Obama', 'George W. Bush');
INSERT INTO social_network VALUES(3,1, 'Barack Obama', 'Laura Bush');

INSERT INTO social_network VALUES(4,2, 'Laura Bush', 'George W. Bush');
INSERT INTO social_network VALUES(5,2, 'Laura Bush', 'Barack Obama');
INSERT INTO social_network VALUES(6,2, 'Laura Bush', 'Michelle Obama');

INSERT INTO social_network VALUES(7,3, 'Jenna Bush', 'George W. Bush');
INSERT INTO social_network VALUES(8,3, 'Jenna Bush', 'Laura Bush');
INSERT INTO social_network VALUES(9,3, 'Jenna Bush', 'Malia Obama');
INSERT INTO social_network VALUES(10,3, 'Jenna Bush', 'Sasha Obama');

INSERT INTO social_network VALUES(11,4, 'Barbara Bush', 'George W. Bush');
INSERT INTO social_network VALUES(12,4, 'Barbara Bush', 'Laura Bush');
INSERT INTO social_network VALUES(13,4, 'Barbara Bush', 'Malia Obama');
INSERT INTO social_network VALUES(14,4, 'Barbara Bush', 'Sasha Obama');

INSERT INTO social_network VALUES(15,5, 'Michelle Obama', 'Barack Obama');
INSERT INTO social_network VALUES(16,5, 'Michelle Obama', 'George W. Bush');
INSERT INTO social_network VALUES(17,5, 'Michelle Obama', 'Laura Bush');

INSERT INTO social_network VALUES(18,6, 'Malia Obama', 'Barack Obama');
INSERT INTO social_network VALUES(19,6, 'Malia Obama', 'Michelle Obama');
INSERT INTO social_network VALUES(20,6, 'Malia Obama', 'Jenna Bush');
INSERT INTO social_network VALUES(21,6, 'Malia Obama', 'Barbara Bush');

INSERT INTO social_network VALUES(22,7, 'Sasha Obama', 'Barack Obama');
INSERT INTO social_network VALUES(23,7, 'Sasha Obama', 'Michelle Obama');
INSERT INTO social_network VALUES(24,7, 'Sasha Obama', 'Jenna Bush');
INSERT INTO social_network VALUES(25,7, 'Sasha Obama', 'Barbara Bush');

INSERT INTO social_network VALUES(26,8, 'George W. Bush', 'Barack Obama');
INSERT INTO social_network VALUES(27,8, 'George W. Bush', 'Michelle Obama');
INSERT INTO social_network VALUES(28,8, 'George W. Bush', 'Laura Bush');
