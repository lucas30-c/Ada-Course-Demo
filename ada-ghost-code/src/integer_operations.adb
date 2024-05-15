pragma Ada_2012;
package body Integer_Operations is

   ------------------------
   -- Add_Incorrect_Spec --
   ------------------------

   function Add_Incorrect_Spec (X : Integer; Y : Integer) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True,
         "Add_Incorrect_Spec unimplemented");
      return raise Program_Error
          with "Unimplemented function Add_Incorrect_Spec";
   end Add_Incorrect_Spec;

   ---------
   -- Add --
   ---------

   function Add (X : Integer; Y : Integer) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "Add unimplemented");
      return raise Program_Error with "Unimplemented function Add";
   end Add;

   --------------
   -- Subtract --
   --------------

   function Subtract (X : Integer; Y : Integer) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "Subtract unimplemented");
      return raise Program_Error with "Unimplemented function Subtract";
   end Subtract;

end Integer_Operations;
