LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sr IS
PORT (
	CLK : IN STD_LOGIC;
	D7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	X : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END sr;

ARCHITECTURE ecu OF sr IS

	SIGNAL CLKC : STD_LOGIC_VECTOR(27 DOWNTO 0)

	TYPE TYPES IS (
		R,
		N0, N3, N7,
		C, O, P, I, A
	);
	
	SIGNAL ST, NST : TYPES;
	
BEGIN

	PROCESS(CLK)
	BEGIN
	
		IF rising_edge(CLK) THEN
			IF CLKC = "0001011111010111100001000000" THEN
				CLKC <= (OTHERS => '0');
				ST <= NST;
			ELSE
				CLKC <= CLKC + '1';
			END IF;
		END IF;

	END PROCESS;
	
	PROCESS(ST, X)
	BEGIN
	
		CASE ST IS
		
			WHEN R =>
				IF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "01" AND R = '1' THEN NST <= C;
				ELSE NST <= R;
				END IF;
		
			WHEN N0 =>
				IF X = "00" AND R = '1' THEN NST <= N3;
				ELSIF X = "01" AND R = '1' THEN NST <= C;
				ELSIF X = "10" AND R = '1' THEN NST <= N0;
				ELSE NS <= R;
				END IF;
			
		WHEN N3 =>
				IF X = "00" AND R = '1' THEN NST <= N7;
				ELSIF X = "01" AND R = '1' THEN NST <= C;
				ELSIF X = "10" AND R = '1' THEN NST <= N3;
				ELSE NS <= R;
				END IF;
				
			WHEN N7 =>
				IF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "01" AND R = '1' THEN NST <= C;
				ELSIF X = "10" AND R = '1' THEN NST <= N7;
				ELSE NS <= R;
				END IF;
			
			WHEN C =>
				IF X = "01" AND R = '1' THEN NST <= O;
				ELSIF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "11" AND R = '1' THEN NST <= C;
				ELSE NS <= R;
				END IF;
			
			WHEN O =>
				IF X = "01" AND R = '1' THEN NST <= P;
				ELSIF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "11" AND R = '1' THEN NST <= O;
				ELSE NS <= R;
				END IF;
				
			WHEN P =>
				IF X = "01" AND R = '1' THEN NST <= I;
				ELSIF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "11" AND R = '1' THEN NST <= P;
				ELSE NS <= R;
				END IF;
			
			WHEN I =>
				IF X = "01" AND R = '1' THEN NST <= A;
				ELSIF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "11" AND R = '1' THEN NST <= I;
				ELSE NS <= R;
				END IF;
			
			
			WHEN A =>
				IF X = "01" AND R = '1' THEN NST <= C;
				ELSIF X = "00" AND R = '1' THEN NST <= N0;
				ELSIF X = "11" AND R = '1' THEN NST <= A;
				ELSE NS <= R;
				END IF;
		
		END CASE;
	
	END PROCESS;
	
	PROCESS(ST)
	BEGIN
	
		CASE ST IS
		
			WHEN R  	=> D7 <= "1111111";
			WHEN N0  => D7 <= "1000000";
			WHEN N3  => D7 <= "0110000";
			WHEN N7  => D7 <= "1111000";
			WHEN C  	=> D7 <= "1000110";
			WHEN O  	=> D7 <= "1000000";
			WHEN P  	=> D7 <= "0001100";
			WHEN I 	=> D7 <= "1111001";
			WHEN A  	=> D7 <= "0001000";
			
		END CASE;
	
	END PROCESS;
		
END ecu;
