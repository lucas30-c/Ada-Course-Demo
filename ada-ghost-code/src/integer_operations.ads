with Ada.Numerics.Big_Numbers;
use Ada.Numerics.Big_Numbers;


--  with Big_Integers;

package Integer_Operations with SPARK_Mode is
   
-- SPARK Prover wants to prove the code is free of runtime error.(You need to add assumptions. Pre/Post Conditions)     

   function Add_Incorrect_Spec(X:Integer; Y:Integer) return Integer with
     Pre => (X + Y >= Integer'First and X + Y <= Integer'Last), -- overflow check might fail
     Post => Add_Incorrect_Spec'Result = X + Y;
   
   -- mathematical integers
   -- Math(X) + Math(Y) >= Math(Integer'First) and <= Math(Integer'Last) 
   -- (It can't be executed on the machine)
   
   -- X          Y
   -- machine integers
   -- -2^31 ... 2^31 - 1
   
   function Add(X:Integer; Y:Integer) return Integer with
     Ghost,
     Pre => (In_Range(Arg => To_Big_Integer(X) + To_Big_Integer(Y), 
             Low => To_Big_Integer(Integer'First), 
             High => To_Big_Integer(Integer'Last))),
     Post => Add'Result = To_Integer(To_Bignum(X) + To_Bignum(Y));
   
   function Subtract(X:Integer; Y : Integer) return Integer;
     

end Integer_Operations;
