LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY m5p IS
PORT (
	CLK, X : IN STD_LOGIC;
	D7 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
);
END m5p;

ARCHITECTURE ecu OF m5p IS

	SIGNAL CLKC : STD_LOGIC_VECTOR(27 DOWNTO 0);
	
	TYPE TYPES IS (
		M0, M5, M10, M15, M20, M25, M30,
		P0, P2, P3, P5, P7, P11, P13, P17, P19, P23, P29, P31
	);
	
	SIGNAL S, NS : TYPES;
	
BEGIN
	
	PROCESS(CLK)
	BEGIN
	
		IF rising_edge(CLK) THEN
		
			IF CLKC = "0001011111010111100001000000" THEN
				CLKC <= (OTHERS => '0');
				S <= NS;
			ELSE
				CLKC <= CLKC + '1';
			END IF;
			
		END IF;
	
	END PROCESS;

	PROCESS(S, X)
	BEGIN
	
		CASE S IS
		
			WHEN M0 =>
				IF X = '1' THEN NS <= M5;
				ELSE NS <= P0;
				END IF;
			
			WHEN M5 =>
				IF X = '1' THEN NS <= M10;
				ELSE NS <= P0;
				END IF;
			
			WHEN M10 =>
				IF X = '1' THEN NS <= M15;
				ELSE NS <= P0;
				END IF;
			
			WHEN M15 =>
				IF X = '1' THEN NS <= M20;
				ELSE NS <= P0;
				END IF;
			
			WHEN M20 =>
				IF X = '1' THEN NS <= M25;
				ELSE NS <= P0;
				END IF;
			
			WHEN M25 =>
				IF X = '1' THEN NS <= M30;
				ELSE NS <= P0;
				END IF;
			
			WHEN M30 =>
				IF X = '1' THEN NS <= M0;
				ELSE NS <= P0;
				END IF;
			
			WHEN P0 =>
				IF X = '0' THEN NS <= P2;
				ELSE NS <= M0;
				END IF;
			
			WHEN P2 =>
				IF X = '0' THEN NS <= P3;
				ELSE NS <= M0;
				END IF;
			
			WHEN P3 =>
				IF X = '0' THEN NS <= P5;
				ELSE NS <= M0;
				END IF;
			
			WHEN P5 =>
				IF X = '0' THEN NS <= P7;
				ELSE NS <= M0;
				END IF;
			
			WHEN P7 =>
				IF X = '0' THEN NS <= P11;
				ELSE NS <= M0;
				END IF;
			
			WHEN P11 =>
				IF X = '0' THEN NS <= P13;
				ELSE NS <= M0;
				END IF;
			
			WHEN P13 =>
				IF X = '0' THEN NS <= P17;
				ELSE NS <= M0;
				END IF;
			
			WHEN P17 =>
				IF X = '0' THEN NS <= P19;
				ELSE NS <= M0;
				END IF;
			
			WHEN P19 =>
				IF X = '0' THEN NS <= P23;
				ELSE NS <= M0;
				END IF;
			
			WHEN P23 =>
				IF X = '0' THEN NS <= P29;
				ELSE NS <= M0;
				END IF;
			
			WHEN P29 =>
				IF X = '0' THEN NS <= P31;
				ELSE NS <= M0;
				END IF;
			
			WHEN P31 =>
				IF X = '0' THEN NS <= P2;
				ELSE NS <= M0;
				END IF;
			
		END CASE;
	
	END PROCESS;
	
	PROCESS(S)
	BEGIN
	
		CASE S IS
		
			WHEN M0 	=> D7 <= "11111111000000";
			WHEN M5 	=> D7 <= "11111110010010";
			WHEN M10 => D7 <= "11110011000000";
			WHEN M15 => D7 <= "11110010010010";
			WHEN M20 => D7 <= "01001001000000";
			WHEN M25 => D7 <= "01001000010010";
			WHEN M30 => D7 <= "01100001000000";
			WHEN P0 	=> D7 <= "11111111111111";
			WHEN P2 	=> D7 <= "11111110100100";
			WHEN P3 	=> D7 <= "11111110110000";
			WHEN P5 	=> D7 <= "11111110010010";
			WHEN P7 	=> D7 <= "11111111111000";
			WHEN P11 => D7 <= "11110011111001";
			WHEN P13 => D7 <= "11110010110000";
			WHEN P17 => D7 <= "11110011111000";
			WHEN P19 => D7 <= "11110010010000";
			WHEN P23 => D7 <= "01001000110000";
			WHEN P29 => D7 <= "01001000010000";
			WHEN P31 => D7 <= "01100001111001";
			
		END CASE;
	
	END PROCESS;
	
END ecu;
