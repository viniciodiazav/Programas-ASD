LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY p5 IS
PORT (
	X: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	A, B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END p5;

ARCHITECTURE ecu OF p5 IS
BEGIN

	PROCESS(X)
	BEGIN
		IF X = "000" THEN
			S <= ('0' & A) + ('0' & B);
		ELSIF X = "001" THEN
			S <= ('0' & A) - ('0' & B);
			
		ELSIF X = "010" THEN
			IF A > B THEN
				S <= "100";
			ELSIF A < B THEN
				S <= "010";
			ELSE
				S <= "001";
			END IF;
		ELSIF X = "011" THEN
			S <= '0' & (B(1) AND A(1)) & (B(0) AND A(0));
		ELSIF X = "100" THEN
			S <= '0' & (B(1) OR A(1)) & (B(0) OR A(0));
		ELSIF X = "101" THEN
			S <= '0' & (B(1) XOR A(1)) & (B(0) XOR A(0));
		ELSIF X = "110" THEN
			S <= '0' & (NOT A(1)) & (NOT A(0));
		ELSE
			S <= "000";
		END IF;
	END PROCESS;

END ecu;
