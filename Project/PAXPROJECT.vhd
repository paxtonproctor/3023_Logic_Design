-- Student: Paxton Proctor
-- Instructor: Dr.Passos
-- Class: CMPS 3023 Logic Design
-- Project 1
-- Purpose: design mini micro processor that requires to execute some instructions.

library ieee;
use ieee.std_logic_1164.all;

-------REGISTER Entities-------
entity Registers is
  port(
            clock           : in std_logic;                       --Clock to update register
            enable          : in std_logic;                       --Enable to update register
            inputs          : in std_logic_vector  (7 downto 0);  --load entity
            andinputs       : in std_logic_vector  (7 downto 0);  --holds and value
            andenable       : in std_logic;                       --andEnable to update register
            subinputs       : in std_logic_vector  (7 downto 0);  --holds sub value
            subenable       : in std_logic;                       --subEnable to update register
            orinputs        : in std_logic_vector  (7 downto 0);  --holds or value
            orenable        : in std_logic;                       --orEnable to update register
            addinputs       : in std_logic_vector  (7 downto 0);  --holds add value
            addenable       : in std_logic;                       --addEnable to update register
            movinputs       : in std_logic_vector  (7 downto 0);  --holds mov value
            movenable       : in std_logic;                       --movEnable to update register
            outputs         : out std_logic_vector (7 downto 0)  --output value to register
				);
end entity;                                                                                                                                                                                                                                                                 --Paxton Proctor
  
library ieee;
use ieee.std_logic_1164.all;

-------REGISTER Architecture-------
architecture intructions of Registers is
    signal  value : std_logic_vector (7 downto 0);
begin
    process(clock)
    begin
            if (Rising_edge(clock)) then                          --if statements test for a signal that are equal to 1
                    if(enable = '1') then                         --value changes if signal is equal to 1
                            value <= inputs;
                    end if;
                    if(andenable = '1') then
                            value <= andinputs;
                    end if;
                    if(subenable = '1') then
                            value <= subinputs;
                    end if;
                    if(orenable = '1') then
                            value <= orinputs;
                    end if;
                    if(addenable = '1') then
                            value <= addinputs;
                    end if;
                    if(movenable = '1') then
                            value <= movinputs;
                    end if;
            end if;
    end process;
            outputs <= value;
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

-------OUTPUT-------
entity output is
  port(
            mainoutput       : out std_logic_vector (7 downto 0);  --output will show what is in the register
            signal  R0outputit : std_logic_vector (7 downto 0);
            signal  R1outputit : std_logic_vector (7 downto 0);      --signals that holds value from whatever register we are using
            signal  R2outputit : std_logic_vector (7 downto 0);
            signal  R3outputit : std_logic_vector (7 downto 0);
            R0outputEnable   : std_logic;
            R1outputEnable   : std_logic;
            R2outputEnable   : std_logic;
            R3outputEnable   : std_logic
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture instructions of output is
begin
        process (R0outputit, R1outputit, R2outputit, R3outputit)
		  begin
                            if (R0outputEnable = '1') then
                                  mainoutput <= R0outputit;
                            elsif (R1outputEnable = '1') then
                                  mainoutput <= R1outputit;
                            elsif (R2outputEnable = '1') then
                                  mainoutput <= R2outputit;
                            elsif (R3outputEnable = '1') then
                                  mainoutput <= R3outputit;
									 end if;
		  end process;
end instructions;
  
library ieee;
use ieee.std_logic_1164.all;

--------LOADER--------
entity loader is
  port(
            signal  R0loadEnable : std_logic;                        --signal loads a value to register
            signal  R1loadEnable : std_logic;
            signal  R2loadEnable : std_logic;
            signal  R3loadEnable : std_logic;
            load                 : out std_logic_vector(7 downto 0);
            signal command       : std_logic_vector(15 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of loader is
begin
        process(R0loadEnable, R1loadEnable, R2loadEnable, R3loadEnable, command)
        begin
					if(R3loadEnable = '1' or R2loadEnable = '1' or R1loadEnable = '1' or R0loadEnable = '1') then
							load(5) <= command(12);
							load(4 downto 0) <= command(6 downto 2);
					end if;
        end process;
end intructions;

library ieee;
use ieee.std_logic_1164.all;

-- AND --
entity andentity is
  port(
            signal R0andEnable	: std_logic;
				signal R1andEnable	: std_logic;
				signal R2andEnable	: std_logic;
				signal R3andEnable	: std_logic;
				andimmediate			: inout std_logic_vector (7 downto 0);
				signal command			: std_logic_vector (15 downto 0);
				signal R0Output		: std_logic_vector (7 downto 0);
				signal R1Output		: std_logic_vector (7 downto 0);
				signal R2Output		: std_logic_vector (7 downto 0);
				signal R3Output		: std_logic_vector (7 downto 0);
				andload					: out std_logic_vector (7 downto 0)
				
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of andentity is
begin
    process(R0andEnable, R1andEnable, R2andEnable, R3andEnable, command, andimmediate, R0Output, R1output, R2output, R3output)
				begin
							if(R0andEnable = '1' or R1andEnable = '1' or R2andEnable = '1' or R3andEnable = '1') then
									andimmediate(5) <= command(12);
									andimmediate(4 downto 0) <= command(6 downto 2);
							end if;
							if(R0andEnable = '1') then
								andload <= andimmediate and R0output;
							elsif(R1andEnable = '1') then
								andload <= andimmediate and R1output;
							elsif(R2andEnable = '1') then
								andload <= andimmediate and R2output;
							elsif(R3andEnable = '1') then
								andload <= andimmediate and R3output;
							end if;
				end process;
end intructions;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- SUB --
entity subentity is
  port(
            signal R0subEnable	: std_logic;
				signal R1subEnable	: std_logic;
				signal R2subEnable	: std_logic;
				signal R3subEnable	: std_logic;
				subload					: out std_logic_vector (7 downto 0);
				signal R0output		: std_logic_vector (7 downto 0);
				signal R1output		: std_logic_vector (7 downto 0);
				signal R2output		: std_logic_vector (7 downto 0);
				signal R3output		: std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
  
architecture intructions of subentity is
begin
    process(R0subEnable,R1subEnable, R2subEnable, R3subEnable, R0output, R1output, R2output, R3output)
				begin
							if(R0subEnable = '1') then
									subload <= R0output - R1output - R2output - R3output;
							elsif(R1subEnable = '1') then
									subload <= R1output - R2output - R3output - R0output;
							elsif(R2subEnable = '1') then
									subload <= R2output - R3output - R0output - R1output;
							elsif(R3subEnable = '1') then
									subload <= R3output - R0output - R1output - R2output;
							end if;
				end process;						
end intructions;  

library ieee;
use ieee.std_logic_1164.all;

entity orentity is
  port(
            signal R0output		: std_logic_vector (7 downto 0);
				signal R1output		: std_logic_vector (7 downto 0);
				signal R2output		: std_logic_vector (7 downto 0);
				signal R3output		: std_logic_vector (7 downto 0);
				signal R0orEnable    : std_logic;
				signal R1orEnable    : std_logic;
				signal R2orEnable    : std_logic;
				signal R3orEnable    : std_logic;
				orload					: out std_logic_vector (7 downto 0)
				
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of orentity is
begin
				process(R0orEnable,R1orEnable, R2orEnable, R3orEnable, R3output, R2output, R1output, R0output)
							begin
										if(R0orEnable = '1' or R1orEnable = '1' or R2orEnable = '1' or R3orEnable = '1') then
												orload <= R0output or R1output or R2output or R3output;
										end if;
							end process;
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

--ADD--
entity addentity is
  port(
            signal R0addEnable	: std_logic;
				signal R1addEnable	: std_logic;
				signal R2addEnable	: std_logic;
				signal R3addEnable	: std_logic;
				addload					: out std_logic_vector (7 downto 0);
				signal R0output		: std_logic_vector (7 downto 0);
				signal R1output		: std_logic_vector (7 downto 0);
				signal R2output		: std_logic_vector (7 downto 0);
				signal R3output		: std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
  
architecture intructions of addentity is
begin
		process(R0addEnable,R1addEnable, R2addEnable, R3addEnable, R0output, R1output, R2output, R3output)
				begin
							if(R0addEnable = '1') then
									addload <= R0output + R1output + R2output + R3output;
							elsif(R1addEnable = '1') then
									addload <= R1output + R2output + R3output + R0output;
							elsif(R2addEnable = '1') then
									addload <= R2output + R3output + R0output + R1output;
							elsif(R3addEnable = '1') then
									addload <= R3output + R0output + R1output + R2output;
							end if;
				end process;
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity moventity is
  port(
            signal R0movEnable		: std_logic;
				signal R1movEnable		: std_logic;
				signal R2movEnable		: std_logic;
				signal R3movEnable		: std_logic;
				movload						: out std_logic_vector (7 downto 0);
				signal R0output			: std_logic_vector (7 downto 0);
				signal R1output			: std_logic_vector (7 downto 0);
				signal R2output			: std_logic_vector (7 downto 0);
				signal R3output			: std_logic_vector (7 downto 0)
				);
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of moventity is
begin
				process(R0movEnable, R1movEnable, R2movEnable, R3movEnable, R0output, R1output, R2output, R3output)
							begin
									if(R0movEnable = '1') then
											movload <= R0output;
									elsif(R1movEnable = '1') then
											movload <= R1output;
									elsif(R2movEnable = '1') then
											movload <= R2output;
									elsif(R3movEnable = '1') then
											movload <= R3output;
									end if;
							end process;
end intructions;

library ieee;
use ieee.std_logic_1164.all;

entity PAXPROJECT is 
	port(
		command     : in std_logic_vector (15 downto 0);						--Command read by the microprocessor.
		execute     : in std_logic;												--Clock that is used to update the register.
		upd 	      : in std_logic;												--Signal that (is supposed to) change the value of the register upon its rising edge.
		mainoutput  : out std_logic_vector (7 downto 0)							--Output pin that shows what's currently in register R1 (and upon the Out command, what's in R2).
	);
end entity;

--Main--
architecture Instructions of PAXPROJECT is
					component Registers
					port(
							clock           : in std_logic;                       --Clock to update register
							enable          : in std_logic;                       --Enable to update register
							inputs          : in std_logic_vector  (7 downto 0);  --load entity
							andinputs       : in std_logic_vector  (7 downto 0);  --holds and value
							andenable       : in std_logic;                       --andEnable to update register
							subinputs       : in std_logic_vector  (7 downto 0);  --holds sub value
							subenable       : in std_logic;                       --subEnable to update register
							orinputs        : in std_logic_vector  (7 downto 0);  --holds or value
							orenable        : in std_logic;                       --orEnable to update register
							addinputs       : in std_logic_vector  (7 downto 0);  --holds add value
							addenable       : in std_logic;                       --addEnable to update register
							movinputs       : in std_logic_vector  (7 downto 0);  --holds mov value
							movenable       : in std_logic;                       --movEnable to update register
							outputs         : out std_logic_vector (7 downto 0)  --output value to register
					);
					end component;
					
					component Output
					port(
							mainoutput       : out std_logic_vector (7 downto 0);  --output will show what is in the register
							signal  R0outputit : std_logic_vector (7 downto 0);
							signal  R1outputit : std_logic_vector (7 downto 0);      --signals that holds value from whatever register we are using
							signal  R2outputit : std_logic_vector (7 downto 0);
							signal  R3outputit : std_logic_vector (7 downto 0);
							R0outputEnable   : std_logic;
							R1outputEnable   : std_logic;
							R2outputEnable   : std_logic;
							R3outputEnable   : std_logic
					);
					end component;
					
					component loader
					port (
							signal  R0loadEnable : std_logic;                        --signal loads a value to register
							signal  R1loadEnable : std_logic;
							signal  R2loadEnable : std_logic;
							signal  R3loadEnable : std_logic;
							load                 : out std_logic_vector(7 downto 0);
							signal command       : std_logic_vector(15 downto 0)
					);
					end component;
					
					component andentity
					port(
							signal R0andEnable	: std_logic;
							signal R1andEnable	: std_logic;
							signal R2andEnable	: std_logic;
							signal R3andEnable	: std_logic;
							andimmediate			: inout std_logic_vector (7 downto 0);
							signal command			: std_logic_vector (15 downto 0);
							signal R0Output		: std_logic_vector (7 downto 0);
							signal R1Output		: std_logic_vector (7 downto 0);
							signal R2Output		: std_logic_vector (7 downto 0);
							signal R3Output		: std_logic_vector (7 downto 0);
							andload					: out std_logic_vector (7 downto 0)
				
					);
					end component;
					
					component subentity
					port(
							signal R0subEnable	: std_logic;
							signal R1subEnable	: std_logic;
							signal R2subEnable	: std_logic;
							signal R3subEnable	: std_logic;
							subload					: out std_logic_vector (7 downto 0);
							signal R0output		: std_logic_vector (7 downto 0);
							signal R1output		: std_logic_vector (7 downto 0);
							signal R2output		: std_logic_vector (7 downto 0);
							signal R3output		: std_logic_vector (7 downto 0)
					);
					end component;
					
					component orentity
					port(
							signal R0output		: std_logic_vector (7 downto 0);
							signal R1output		: std_logic_vector (7 downto 0);
							signal R2output		: std_logic_vector (7 downto 0);
							signal R3output		: std_logic_vector (7 downto 0);
							signal R0orEnable    : std_logic;
							signal R1orEnable    : std_logic;
							signal R2orEnable    : std_logic;
							signal R3orEnable    : std_logic;
							orload					: out std_logic_vector (7 downto 0)
					);
					end component;
					
					component addentity
					port(
							signal R0addEnable	: std_logic;
							signal R1addEnable	: std_logic;
							signal R2addEnable	: std_logic;
							signal R3addEnable	: std_logic;
							addload					: out std_logic_vector (7 downto 0);
							signal R0output		: std_logic_vector (7 downto 0);
							signal R1output		: std_logic_vector (7 downto 0);
							signal R2output		: std_logic_vector (7 downto 0);
							signal R3output		: std_logic_vector (7 downto 0)
					);
					end component;
					
					component moventity
					port(
							signal R0movEnable		: std_logic;
							signal R1movEnable		: std_logic;
							signal R2movEnable		: std_logic;
							signal R3movEnable		: std_logic;
							movload						: out std_logic_vector (7 downto 0);
							signal R0output			: std_logic_vector (7 downto 0);
							signal R1output			: std_logic_vector (7 downto 0);
							signal R2output			: std_logic_vector (7 downto 0);
							signal R3output			: std_logic_vector (7 downto 0)
					);
					end component;
					
					signal R0outputit, R1outputit, R2outputit, R3outputit, R0output, R1output, R2output, R3output																											: std_logic_vector (7 downto 0);
					signal R0loadEnable, R1loadEnable, R2loadEnable, R3loadEnable, R0outputEnable, R1outputEnable, R2outputEnable, R3outputEnable, R0addEnable, R1addEnable, R2addEnable, R3addEnable, R0SubEnable, R1SubEnable, R2SubEnable, R3SubEnable, R0andEnable, R1andEnable, R2andEnable, R3andEnable, R0movEnable, R1movEnable, R2movEnable, R3movEnable, R0orEnable, R1orEnable, R2orEnable, R3orEnable : std_logic;
					signal load, andimmediate, andload, orload, movload, addload, subload																				: std_logic_vector (7 downto 0);
begin					
					--outputenable--
					R0OutputEnable 	<= not command(12) and not command(11) and not command(10) and not command(9) and not command(8) and not command(7) and not command(3) and not command(2) and command(1) and command (0);
					
					R1OutputEnable 	<= not command(12) and not command(11) and not command(10) and not command(9) and not command(8) and not command(7) and not command(3) and command(2) and command(1) and command (0);
					
					R2OutputEnable 	<= not command(12) and not command(11) and not command(10) and not command(9) and not command(8) and not command(7) and command(3) and not command(2) and command(1) and command (0);
					
					R3OutputEnable 	<= not command(12) and not command(11) and not command(10) and not command(9) and not command(8) and not command(7) and command(3) and command(2) and command(1) and command (0);
					
					--loadenable--
					R0loadEnable 		<= not command(15) and command(14) and not command(13) and not command(8) and not command(7);
					
					R1loadEnable		<= not command(15) and command(14) and not command(13) and not command(8) and command(7);
					
					R2loadEnable   	<= not command(15) and command(14) and not command(13) and command(8) and not command(7);
					
					R3loadEnable   	<= not command(15) and command(14) and not command(13) and command(8) and command(7);
					
					--andenable--
					R0andEnable 	   <= command(11) and not command(10) and not command(8) and not command(7);
					
					R1andEnable 	   <= command(11) and not command(10) and not command(8) and command(7);
					
					R2andEnable 	   <= command(11) and not command(10) and command(8) and not command(7);
					
					R3andEnable 	   <= command(11) and not command(10) and command(8) and command(7);
					
					--subenable--
					R0subEnable 	   <= command(12) and command(11) and command(10) and not command(8) and not command(7) and not command(6) and not command(5);
					
					R1subEnable 	   <= command(12) and command(11) and command(10) and not command(8) and command(7) and not command(6) and not command(5);
					
					R2subEnable 	   <= command(12) and command(11) and command(10) and command(8) and not command(7) and not command(6) and not command(5);
					
					R3subEnable 	   <= command(12) and command(11) and command(10) and command(8) and command(7) and not command(6) and not command(5);
					
					--orenable--
					R0orEnable			<= not command(12) and command(11) and command (10) and not command(8) and not command(7);
					
					R1orEnable			<= not command(12) and command(11) and command (10) and not command(8) and command(7);
					
					R2orEnable			<= not command(12) and command(11) and command (10) and command(8) and not command(7);
					
					R3orEnable			<= not command(12) and command(11) and command (10) and command(8) and command(7);
					
					--addenable--
					R0addEnable    	<= command(11) and command(10) and not command(8) and not command(7) and not command(6) and command(5) and not command(1) and command(0);
					
					R1addEnable    	<= command(11) and command(10) and not command(8) and command(7) and not command(6) and command(5) and not command(1) and command(0);
					
					R2addEnable    	<= command(11) and command(10) and command(8) and not command(7) and not command(6) and command(5) and not command(1) and command(0);
					
					R3addEnable    	<= command(11) and command(10) and command(8) and command(7) and not command(6) and command(5) and not command(1) and command(0);
					
					--movenable--
					R0movEnable			<= command(15) and not command(14) and not command(13) and not command(8) and not command(7) and command(1) and not command(0);
					
					R1movEnable			<= command(15) and not command(14) and not command(13) and not command(8) and command(7) and command(1) and not command(0);
					
					R2movEnable			<= command(15) and not command(14) and not command(13) and command(8) and not command(7) and command(1) and not command(0);
					
					R3movEnable			<= command(15) and not command(14) and not command(13) and command(8) and command(7) and command(1) and not command(0);
					
					--do it--
					loadit				: loader port map (R0loadEnable, R1loadEnable, R2loadEnable, R3loadEnable, load, command);
					
					andit					: andentity port map (R0andEnable, R1andEnable, R2andEnable, R3andEnable, andimmediate, command, R0output, R1output, R2output, R3output, andload);
					
					subit					: subentity port map (R0subEnable, R1subEnable, R2subEnable, R3subEnable, R3output, R2output, R1output, R0output, subload);
					
					orit					: orentity port map (R0output, R1output, R2output, R3output, R0orEnable, R1orEnable, R2orEnable, R3orEnable, orload);
					
					addit					: addentity port map (R0addEnable, R1addEnable, R2addEnable, R3addEnable, addload, R3output, R2output, R1output, R0output);
					
					movit					: moventity port map (R0movEnable, R1movEnable, R2movEnable, R3movEnable, R3output, R2output, R1output, R0output, movload);
					
					R0						: Registers port map(execute, R0loadEnable, load, andload, R0andEnable, subload, R0subEnable, orload, R0orEnable, addload, R0addEnable, movload, R0movEnable, R0output);
					
					R1						: Registers port map(execute, R1loadEnable, load, andload, R1andEnable, subload, R1subEnable, orload, R1orEnable, addload, R1addEnable, movload, R1movEnable, R1output);
					
					R2						: Registers port map(execute, R2loadEnable, load, andload, R2andEnable, subload, R2subEnable, orload, R2orEnable, addload, R2addEnable, movload, R2movEnable, R2output);
					
					R3						: Registers port map(execute, R3loadEnable, load, andload, R3andEnable, subload, R3subEnable, orload, R3orEnable, addload, R3addEnable, movload, R3movEnable, R3output);
					
					outputit				: output port map (mainoutput, R0Outputit, R1Outputit, R2Outputit, R3Outputit, R0outputEnable, R1outputEnable, R2outputEnable, R3outputEnable);
end Instructions; 
