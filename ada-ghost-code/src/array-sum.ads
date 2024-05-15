with Big_Integers;
Use Big_Integers;

package Array-Sum with SPARK_Mode is
 
   type Integer_Array is array(Positive range<>) of Integer;
   
   function Sum_Blind(A : Integer_Array) return Integer with
     Pre => (if A'Length > 0 then (for all J in Sum_Acc(A)'Range => 
              In_Range())),

end Array-Sum;
