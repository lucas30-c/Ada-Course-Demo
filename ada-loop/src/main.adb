with ADA.Text_IO;
use ADA.Text_IO;

procedure Main with SPARK_Mode is
   Count : Integer;
   R : Integer;

begin
   -- Need to tell the SPARK Prover what is true about the loop for an arbitrary iteration
   Count := 0;
   R := 0;

   -- (1)
   while Count < 100 loop
      -- A loop invariant is a property that describes the behaviour of a loop
      -- In particular, a property that is true for each iteration of the loop
      -- (i.e. describes an arbitrary iteration / execution of the loop body)
      --
      -- A loop invariant has to satisfy 3 conditions:
      -- 1. It has to be true when we reach the loop(at position (1))
      -- 2. It has to remain true after each loop iteration
      -- 3. It has to be true after the loop finishes(at position (3))

      pragma Loop_Invariant (R = 5 * Count);

      R := R + 5;
      Count := Count + 1;
   end loop;
   -- (3)

   pragma Assert(R = 500);
   Put_Line("The value of R is " & R'Image);

end Main;
