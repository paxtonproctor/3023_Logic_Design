-- Student: Paxton Proctor
-- Instructor: Dr.Passos
-- Class: CMPS 3023 Logic Design
-- Project 1
-- Purpose: design mini micro processor that requires to execute some instructions.

library ieee;
use ieee.std_logic_1164.all;

-------REGISTER-------
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
  
architecture intructions of Registers is
    signal  value : std_logic_vector (7 downto 0);
begin
    process(clock)
    begin
          --STUFF--
    end process;
            outputs <= value;
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

entity output is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of output is
begin
    --Block of instructions--
end intructions;
  
library ieee;
use ieee.std_logic_1164.all;

entity loader is
  port(
            a               : in std_logic_vector  (7 downto 0);
            b               : in std_logic_vector  (7 downto 0);
            en              : in std_logic;
            c               : out std_logic_vector (7 downto 0)
  );
end entity;
  
library ieee;
use ieee.std_logic_1164.all;
  
architecture intructions of loader is
begin
    --Block of instructions--
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
 
