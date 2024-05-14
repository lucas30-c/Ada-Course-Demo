package body SimpleStack with SPARK_Mode is

   procedure Init(S : out SimpleStack) is
   begin
      S.size := 0;
      S.storage := (others => Default_Item);
   end Init;

   procedure Push(S : in out SimpleStack; I : in Item) is
   begin
      -- Notice there is a risk of overflow; We will use SPARK to address it later
-- Also note that the index starts from 1.
      S.size := S.size + 1;
      S.storage(S.size) := I;
   end Push;


   procedure Pop(S : in out SimpleStack; I : out Item) is
   begin
      I := S.storage(S.size);
      S.size := S.size - 1;
   end Pop;


end SimpleStack;
