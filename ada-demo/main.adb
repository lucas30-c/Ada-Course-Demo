with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

with SimpleStack;

procedure Main with SPARK_Mode is
   package SS is new SimpleStack(100, Integer, 0); -- can be viewed as a class in Java
   
   S : SS.SimpleStack; -- In public space, it has specified the SimpleStack
   I : Integer;
   J : Integer;
begin
   SS.init(S);
   SS.Push(S, 5);
   SS.Push(S, 6);
   
   SS.Pop(S, I); -- I holds 6
   SS.Pop(S, J); -- J holds 5
   
   pragma Assert(I = 6);
   Ada.Integer_Text_IO.Put(I - J); -- print 1
   
   Ada.Text_IO.New_Line;
   
   Ada.Integer_Text_IO.Put(SS.Size(S)); -- print 0
   
end Main;
