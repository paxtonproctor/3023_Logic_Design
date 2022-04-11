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
            outputs         : out std_logic_vector (7 downto 0);  --output value to register
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
            if (falling_edge(clock)) then
                    if(enable = '1') then
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
            mainoutput       : out std_logic_vector (7 downto 0);
            signal  R0output : std_logic_vector (7 downto 0);
            signal  R1output : std_logic_vector (7 downto 0);
            signal  R2output : std_logic_vector (7 downto 0);
            signal  R3output : std_logic_vector (7 downto 0);
            R0outputEnable   : std_logic;
            R1outputEnable   : std_logic;
            R2outputEnable   : std_logic;
            R3outputEnable   : std_logic
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of output is
begin
        process (R0output, R1output, R2output, R3output)
        begin
                            if (R0outputEnable = '1') then
                                  mainoutput <= R0output;
                            elsif (R1outputEnable = '1') then
                                  mainoutput <= R1output;
                            elsif (R2outputEnable = '1') then
                                  mainoutput <= R2output;
                            elsif(R3outputEnable = '1') then
                                  mainoutput <= R3output;
                            elsif
                                  mainoutput <= R2output;
                            elsif
                                  mainoutput <= R1output;
                            else
                                  mainoutput <= R2output;
                            end if;
        end process;
        end;
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

--------LOADER--------
entity loader is
  port(
            signal  R0loadEnable : std_logic;
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
                --IFSTATEMENT--
        end process;
end intructions;

library ieee;
use ieee.std_logic_1164.all;

entity andentity is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of andentity is
begin
    --Block of instructions--
end intructions;

library ieee;
use ieee.std_logic_1164.all;

entity subentity is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of subentity is
begin
    --Block of instructions--
end intructions;  

library ieee;
use ieee.std_logic_1164.all;

entity orentity is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of orentity is
begin
    --Block of instructions--
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

entity addentity is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of addentity is
begin
    --Block of instructions--
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

entity moventity is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of moventity is
begin
    --Block of instructions--
end intructions;
 
