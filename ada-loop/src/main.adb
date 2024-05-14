with ADA.Text_IO;
use ADA.Text_IO;

procedure Main with SPARK_Mode is
   Count : Integer;
   R : Integer;

begin
   Count := 0;
   R := 0;
   while Count < 100 loop
      R := R + 5;
      Count := Count + 1;
   end loop;

   pragma Assert(R = 500);
   Put_Line("The value of R is " & R'Image);

end Main;
