LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p3 IS
PORT (
	A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	P, PA, L1, L2, I : OUT STD_LOGIC;
	MA, ME : INOUT STD_LOGIC
);
END p3;

ARCHITECTURE ecu OF p3 IS
BEGIN

	PROCESS(A)
	BEGIN
		P <= ((A(2) AND A(0)) AND (A(4) XNOR A(3))) OR
		  ((A(1) AND A(0)) AND (A(4) XNOR A(2))) OR
		  ((A(3) NOR A(2)) AND (((NOT A(4)) AND A(1)) OR (A(4) AND A(0)))) OR
		  (A(3) AND A(2) AND (NOT A(1)) AND A(0));
		  
		PA <= ((A(3) XOR A(0)) AND (A(2) NAND A(1))) OR (A(3) AND (NOT A(2)) AND (NOT A(1)));
		
		L1 <= (A(1) XOR A(0)) XOR (A(3) XOR A(2));
		L2 <= ((A(3) NOR A(2)) AND (A(1) XOR A(0))) OR ((A(1) NOR A(0)) AND (A(3) XOR A(2))) OR (A(3) AND A(2) AND A(1) AND A(0));
		
		MA <= (A(4) AND (NOT A(3)) AND A(1)) OR ((A(4) AND (NOT A(2)) AND A(0)) AND ((NOT A(3)) OR A(1)));
		
		ME <= ((A(4) AND A(2) AND (NOT A(0))) AND ((NOT A(1)) OR (A(3) AND A(1)))) OR (A(4) AND A(3) AND (NOT A(1)));
		
		I <= A(4) AND (NOT MA) AND (NOT ME);
		
	END PROCESS;
END ecu;
