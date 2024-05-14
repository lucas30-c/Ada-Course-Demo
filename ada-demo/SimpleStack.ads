generic 
   Max_Size : Integer;
   type Item is private;
   Default_Item : Item;


package SimpleStack with SPARK_Mode is
   
-- Public Space    
   type SimpleStack is private;
   
   procedure Init(S : out SimpleStack)
     with Post => Size(S) = 0;
   
   procedure Push(S : in out SimpleStack; I : in Item)
     with Pre => Size(S) /= Max_Size,
     Post => Size(S) = Size(S'Old) + 1 and 
     Storage(S, Size(S)) = I and -- The last item of the array is I
     (for all J in 1..Size(S'Old) => Storage(S, J) = Storage(S'Old, J));
    -- The original part(earlier stuff) of the stack remains the same
   
   procedure Pop(S : in out SimpleStack; I : out Item)
     with Pre => Size(S) /= 0,
     Post => Size(S) = Size(S'Old) - 1 and
       I = Storage(S'Old, Size(S'Old)) and -- This way will overwrite
       (for all J in 1..Size(S) => Storage(S, J) = Storage(S'Old, J));

   -- Very Important!! You have to write a getter(function in Ada) to make the size(private) accessible. 
   -- It is very common to write these getters in the spec.
   function Size(S : in SimpleStack) return Integer;
   
   -- A dumb idea
   function Storage(S : in SimpleStack; Pos : in Integer) return Item
     with Pre => (Pos in 1..Max_Size);
     -- Ghost; -- Meaning you cannot call this in real code; You can only use this in specification
   -- How could this Storage function cause a runtime error?
   -- Pos out of range
   

-- Private Space     
private 
   type StorageArray is array(1..Max_Size) of Item;
   
   type SimpleStack is record
      size : Integer range 0..Max_Size;
      storage : StorageArray;
   end record;
   
   -- Important
   function Size(S : in SimpleStack) return Integer is
     (S.size);
   
   function Storage(S : in SimpleStack; Pos : in Integer) return Item is 
      (S.storage(Pos));

end SimpleStack;
