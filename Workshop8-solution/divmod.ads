package DivMod with SPARK_Mode is

   procedure DivMod(X : in Positive; N : in Positive; K : out Natural;
                    Remainder : out Natural) with
     Post => (X = K * N + Remainder and Remainder < N);

end DivMod;
