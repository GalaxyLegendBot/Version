

--------AnkuLua Script--------
--------------------------------
removePreference("cbValue")
removePreference("spValueH")
removePreference("spValueM")
removePreference("dexter_money")
removePreference("dop_bonus")
dexter_money = 1
dop_bonus = "0 кредитов"
players = 1

--Сбросы, вылеты из игры, перезапуски
crash_game = 0
last_crash_game = 0
pba = 0

--Арена
t_arena_first = 1
t_arena_max = 140
t_arena_hody = 5
a_podarok = 1

--Пандора время
t_pand_max = 300
t_pand_first = 1

--Небесный портал время
t_np_max = 300
t_np_first = 1

--Бесконечный космос Бои
bk_fight_kor = 0
bk_fight_suma = 0
bk_fight_che = 0
bk_fight_exp = 0


--Фарм основной
t_farm_main_max = 600
t_farm_main_first = 1

--фарм приза
t_priz_max = 300
t_priz_first = 1


--Нажатия и отжатия
pause_press_button = 5
pause_close_button = 5


--Прерывание цикла
t_break_repeat = 300
stop_break_repeat = 0

--Долгое нажатие, задержка
long_click_time = 0.5
next_button = 0

--Сканирование экрана
--setScanInterval(1)




--** FUNCTIONS **--


--Показывает разрешение экрана
function ResolScreen()
local screen = getAppUsableScreenSize()
local width = screen:getX()
local height = screen:getY()
Settings:setScriptDimension(true, 1280)
Settings:setCompareDimension(true, 1280)
wait(.3)
toast("Разрешение экрана "..width.."x"..height)
end

--Считает ресурсы в начале
function Resyrsi_start()
local resursi_loc = Region(157, 269, 284, 350)

local uroven_loc = Region(72, 73, 40, 27) --локация для просмотра информации о герое
local res1 = Region(818, 260, 307, 21) --кредиты
local res2 = Region(818, 304, 307, 21) --кубиты
local res3 = Region(818, 348, 307, 21) --тех.очки
local res4 = Region(818, 392, 307, 21) --энергия галактонита
local res5 = Region(818, 435, 307, 21) --талант
local res6 = Region(818, 479, 307, 21) --монеты декстера
local res7 = Region(818, 524, 307, 21) --темный аэросидерит
local res8 = Region(818, 567, 307, 21) --заслуги


--uroven_loc:existsClick("uroven.png", 30)
if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

press_location_tmp = uroven_loc
Press_button_location()


region_button_tmp = resursi_loc
button_press_tmp = "resursi.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

t1 = numberOCRNoFindException(res1,"resurs")
t2 = numberOCRNoFindException(res2,"resurs")
t3 = numberOCRNoFindException(res3,"resurs")
t4 = numberOCRNoFindException(res4,"resurs")
t5 = numberOCRNoFindException(res5,"resurs")
t6 = numberOCRNoFindException(res6,"resurs")
t7 = numberOCRNoFindException(res7,"resurs")
t8 = numberOCRNoFindException(res8,"resurs")

Exit()

end

--Сравнивает с ресурсами в конце
function Resyrsi_stop()

local resursi_loc = Region(157, 269, 284, 350)
local uroven_loc = Region(72, 73, 40, 27) --локация для просмотра информации о герое
local res1 = Region(818, 260, 307, 21) --кредиты
local res2 = Region(818, 304, 307, 21) --кубиты
local res3 = Region(818, 348, 307, 21) --тех.очки
local res4 = Region(818, 392, 307, 21) --энергия галактонита
local res5 = Region(818, 435, 307, 21) --талант
local res6 = Region(818, 479, 307, 21) --монеты декстера
local res7 = Region(818, 524, 307, 21) --темный аэросидерит
local res8 = Region(818, 567, 307, 21) --заслуги

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

--uroven_loc:existsClick("uroven.png", 30)
press_location_tmp = uroven_loc
Press_button_location()


region_button_tmp = resursi_loc
button_press_tmp = "resursi.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

wait(5)

local t9 = numberOCRNoFindException(res1,"resurs")
local t10 = numberOCRNoFindException(res2,"resurs")
local t11 = numberOCRNoFindException(res3,"resurs")
local t12 = numberOCRNoFindException(res4,"resurs")
local t13 = numberOCRNoFindException(res5,"resurs")
local t14 = numberOCRNoFindException(res6,"resurs")
local t15 = numberOCRNoFindException(res7,"resurs")
local t16 = numberOCRNoFindException(res8,"resurs")

Exit()

print ("Выполнено заданий			: ".. x .. " из " .. z)
if (t9-t1) > 0 then
	print("Кредиты											: " .. t9-t1)
end
if (t10-t2) > 0 then
	print("Кубиты												: " .. t10-t2)
end
if (t11-t3) > 0 then
	print("Тех.очки											: " .. t11-t3)
end
if (t12-t4) > 0 then
	print("Энергия галактонита			: " .. t12-t4)
end
if (t13-t5) > 0 then
	print("Талант												: " .. t13-t5)
end
if (t14-t6) > 0 then
	print("Монеты декстера					: " .. t14-t6)
end
if (t15-t7) > 0 then
	print("Темный аэросидерит			: " .. t15-t7)
end
if (t16-t8) > 0 then
	print("Заслуги											: " .. t16-t8)
end

end

--Сбор цитадели
function Citadel()  --/+/ Улучшены нажатия

--funkciya_loc = Region(424, 548, 424, 129)
local sobrat_all_loc = Region(285, 595, 218, 65)

local sbor_main_loc = Region(5, 129, 222, 310)
if not sbor_main_loc:existsClick("Sbor_aktiven.png") then
	return
end


region_button_tmp = sobrat_all_loc
button_press_tmp = "sbor_all.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

break_repeat = 1
while sobrat_all_loc:exists("sbor_all.png") do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

Exit()

end

--Сбор хоз части
function Hoz_Chast() --/+/ Улучшены нажатия

check_quests_stat_yes = 20
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end


--funkciya_loc = Region(424, 548, 424, 129)
local free_h_loc = Region(75, 566, 1125, 118)




if not existsClick("Hoz_Chast.png") then
	return
end

toast("'Хозяйственная часть'\n("..(x + 1).." из "..z..") заданий")

region_button_tmp = Region(424, 548, 424, 129)
button_press_tmp = "LAZY_LOAD_ui_enemy_repair.png"
--button_press_tmp = Pattern("LAZY_LOAD_ui_enemy_repair.png"):similar(0.95)
--pause_press_button = 5
--pause_close_button = 5
next_button = 1
Press_button_two()


local i = 1
while free_h_loc:existsClick("Free_H.png") do
	free_h_loc:waitVanish("Free_H.png")
	if i > 5 then
		break
	end
	i = i + 1
end


if last_crash_game == 0 then
	x = x + 1
	cbValue20 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end

Exit()

end

--Собираем задания
function Quests()  --/+/ Улучшены нажатия
--wait(5)
local quests_full_loc = Region(885, 0, 395, 82)
local quests_loc = Region(280, 132, 33, 455)
local poluchit_loc = Region(972, 346, 195, 88)
local button_1 = Location(294, 153)
local button_2 = Location(294, 232)
local button_3 = Location(294, 311)
local button_4 = Location(294, 389)
local button_5 = Location(294, 469)
local button_poluchit = Location(1133, 372)
--local button_poluchit_dop = Location()



toast("'Сбор заданий' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

if not quests_full_loc:exists(Pattern("Quests_full.png"):similar(0.95)) then
	cbValue30 = false
	x = x + 1
	return
else
	region_button_tmp = quests_full_loc
	button_press_tmp = "Quests_full.png"
	
	Press_button_two()
end

break_repeat = 1
while not quests_loc:exists((Pattern"Quests_on.png"):similar(0.8)) do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

Quests_poluchit()

button_tmp = button_1
Quests_button()

button_tmp = button_2
Quests_button()

button_tmp = button_3
Quests_button()

button_tmp = button_4
Quests_button()

button_tmp = button_5
Quests_button()



if last_crash_game == 0 then
	x = x + 1
end

Exit()

end

function Quests_poluchit()  --Получаем награду с заданий

local poluchit_loc = Region(972, 346, 195, 88)
local button_poluchit = Location(1133, 372)

r, g, b = getColor(button_poluchit)
break_repeat = 1
while poluchit_loc:exists("poluchit.png") and r > 200 and g > 100 do
	region_button_tmp = poluchit_loc
	button_press_tmp = "poluchit.png"
	Press_button_one()
	r, g, b = getColor(button_poluchit)
	
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
	
end

if existsClick("Quests2.png") then
end

end

function Quests_button() --Перебираем кнопки заданий

local button_1 = Location(294, 153)
local button_2 = Location(294, 232)
local button_3 = Location(294, 311)
local button_4 = Location(294, 389)
local button_5 = Location(294, 469)
local button_poluchit = Location(1133, 372)

r, g, b = getColor(button_tmp)
break_repeat = 1
while r > 200 and g > 50 do
	press_location_tmp = button_tmp
	Press_button_location()
		
	Quests_poluchit()
	
	r, g, b = getColor(button_tmp)
	
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
	
	
end
end





--Арена
function Arena()  --/+/ Улучшены нажатия

t_arena_first = 0
check_quests_stat_yes = 40
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	t_arena_hody = 0
	a_podarok = 0
	return
end


local arena_main = Region(1015, 653, 52, 62)
local arena_left = Region(233, 136, 356, 481)


if not arena_main:existsClick("Arena_first.png", 5) then
	Exit()
	region_button_tmp = arena_main
	button_press_tmp = "Arena_first.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()
	
end


break_repeat = 1
while not exists("Turnir_second.png") do
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

if not exists("max_hody_arena.png") then
	
	if last_crash_game == 0 then
		check_quests_stat_no = 1
		Save_new_quests_stat()
	end
	
	Exit()
	
	return
end

local karma = find("max_hody_arena.png")

local Free_hody_arena = Region(karma:getX() - karma:getW(),karma:getY(), karma:getW(), karma:getH())

Hody_a = numberOCRNoFindException(Free_hody_arena,"otryad")

t_arena_hody = Hody_a
------toast(Hody_a)
wait(1)


if Hody_a < 1 and a_podarok == 0 then
	
	if last_crash_game == 0 then
		x = x + 1
		t_arena_first = 0
		check_quests_stat_no = 1
		Save_new_quests_stat()
	end
	
	Exit()
	--cbValue40 = false
	return
end

--
region_button_tmp = arena_left
button_press_tmp = "Arena_second.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()





--Arena_end_square = Region(382, 641, 151, 61)
--Poluchit_one = Region(522, 626, 256, 49)
--Nagrada_bitvy = Region(657, 98, 261, 39)
--for i = 1, Hody_a do


	break_repeat = 1
	while not exists("max_hody_arena.png") do
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	
	break_repeat = 1
	while exists("Arena_wait.png") do
		------toast("Wait...")
		wait(5)
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	----toast("Атакуем "..i.. " из " .. Hody_a)
	if Hody_a > 0 then
		--toast("Атакуем!")
	
		click(Location(981, 568))
		--existsClick("Sopernik_arena.png", 60)
		------toast("sopernik arena")
		wait(3)
		
		button_press_tmp = "Brosit_vyzov.png"
		Press_button_one_easy()
		
		if not (waitVanish("Brosit_vyzov.png", 3)) then
			button_press_tmp = "Brosit_vyzov.png"
			Press_button_one_easy()
		end
		------toast("brosit vyzov")
		wait(3)
		srajenie_loc = Region(557, 300, 176, 108)
		
		region_button_tmp = srajenie_loc
		button_press_tmp = "Srajenie.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()

		
		------toast("srajenie")
		wait(3)
	
		Propustit()
	
		t_arena_hody = t_arena_hody - 1
		Hody_a = Hody_a - 1
		t_arena:set()
		t_arena_first = 0
	
		wait_location = Region(1132, 0, 148, 54)
		if wait_location:exists("arena_wait.png") then
			break_repeat = 1
			while wait_location:exists("arena_wait.png") do
				wait(2)
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
				------toast("wait end")
			end
		end

		Dalee()
	
		wait(5)
	
	end
	
	
	
--end
	if Hody_a < 1 and a_podarok == 1 then
		--toast("Пройдено, но без подарка")
		exit_loc = Region(927, 0, 353, 141)
		if exists("arena_nagrada_1.png") then
			local arena_nagrada_1_loc = Region(621, 37, 106, 118)
			local poluchit_nagrada_arena_1_loc = Region(540, 619, 205, 66)
			local nagrada_arena_2_loc = Region(648, 92, 284, 51)
			
			region_button_tmp = arena_nagrada_1_loc
			button_press_tmp = "arena_nagrada_1.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_two()

			
			
			region_button_tmp = poluchit_nagrada_arena_1_loc
			button_press_tmp = "poluchit_nagrada_arena_1.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()

			
			region_button_tmp = nagrada_arena_2_loc
			button_press_tmp = "Nagrada_arena_2.png"
			
			Press_button_one()
						
			
			region_button_tmp = poluchit_nagrada_arena_1_loc
			button_press_tmp = "poluchit_all_nagrada_arena.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()

			
			
			Exit()
			
		else
			--toast("Кто-то уже получил подарок!")
		end
		if last_crash_game == 0 then
			x = x + 1
			a_podarok = 0
			check_quests_stat_no = 1
			Save_new_quests_stat()
		end

	end





Exit()
	
end

--Турнир галактики / Считаем вес, очки, уровень соперников
function Find_otryad_wes()

local r1 = Region(865, 285, 161, 17) -- отряд r
local r2 = Region(393, 285, 161, 17) -- отряд l
local r3 = Region(824, 255, 40, 17) -- уровень r
local r4 = Region(350, 255, 40, 17) -- уровень l
local r5 = Region(959, 403, 47, 17) -- победы очки r
local r6 = Region(959, 439, 47, 17) -- проигрышь очки r
local r7 = Region(485, 403, 47, 17 ) -- победы очки l
local r8 = Region(485, 439, 47, 17) -- проигрышь очки l


	preSimilar = Settings:get("MinSimilarity")
    Settings:set("MinSimilarity", 0.7)
	p3 = numberOCRNoFindException(r3,"otryad")
    p4 = numberOCRNoFindException(r4,"otryad")
	p1 = numberOCRNoFindException(r1,"otryad")
    p2 = numberOCRNoFindException(r2,"otryad")
	p5 = numberOCRNoFindException(r5,"otryad")
    p6 = numberOCRNoFindException(r6,"otryad")
    p7 = numberOCRNoFindException(r7,"otryad")
    p8 = numberOCRNoFindException(r8,"otryad")
	Settings:set("MinSimilarity", preSimilar)
	p1 = math.abs (p1)
	p2 = math.abs (p2)
	if p5 == 0 then
		p5 = 0.1
	elseif p6 == 0 then
		p6 = 0.1
	elseif p7 == 0 then
		p7 = 0.1
	elseif p8 == 0 then
		p8 = 0.1
	end
end

--Турнир галактики / Находим соперника
function Find_soperniki()

local poisk_vraga = Region(506, 569, 265, 94)

region_button_tmp = poisk_vraga
button_press_tmp = "poisk.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

local brosit_vyzov = Region(299, 479, 670, 72)

if not brosit_vyzov:exists("Vyzov_turnir.png", 5) then
	tg = -1
	----toast("-1")
	return
end



end

--Рассчитывает из двух соперников на кого напасть
function Raschet_sopernikov()

local c1 = (math.min(p4, p3)) / p4
local c2 = (math.min(p4, p3)) / p3
local c3 = (math.min(p1, p2)) / p2
local c4 = (math.min(p2, p1)) / p1
local c5 = p6 / p5
local c6 = p8 / p7

if p5 == 0 then
	c6 = 5
elseif p7 == 0 then
	c5 = 5
elseif p5 < p8 then
	c6 = 5
elseif p7 < p6 then
	c5 = 5
end
local r = (c2 + c4 + c5) + 0.001
local l = (c1 + c3 + c6) + 0.001
--local r = r + 0.001
--local l = l + 0.001
if l < 0 then
	l = 0
end
if r < 0 then
	r = 0
end

--toast("lvl: "..p4.."\t\t\tlvl: "..p3.."\nOtryad: "..p2.."\t\t\tOtryad: "..p1.."\nPobeda: "..p7.."\t\t\tPobeda: "..p5.."\nPorazenie: "..p8.."\t\t\tPorazenie: "..p6.."\n"..l.."\t\t\t"..r)
local left_fight = Region(316, 491, 166, 50)
local right_fight = Region(786, 490, 170, 51)

if r > l then
	region_button_tmp = right_fight
	button_press_tmp = "Vyzov_turnir.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

else
	region_button_tmp = left_fight
	button_press_tmp = "Vyzov_turnir.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

end

end

--Исчет в Турнире Галактики соперников двое или один
function Find_one_or_two()

local find_two = Region(304, 482, 185, 65)

if find_two:exists("Vyzov_turnir.png") then
	h = 2;
else
	h = 1
end
end

--Сражаемся в турнире
function Srajenie_v_turnire()
local wait_location = Region(1132, 0, 148, 54)
local srajenie_loc = Region(557, 300, 176, 108)

region_button_tmp = srajenie_loc
button_press_tmp = "Srajenie.png"
--pause_press_button = 5
--pause_close_button = 5
Press_button_two()

wait(3)

Propustit()

break_repeat = 1
while wait_location:exists("arena_wait.png") do
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end

end

local turnir_main = Region(41, 5, 308, 50)
break_repeat = 1
while not turnir_main:exists("Turnir_galaktiki.png") do
	press_location_tmp = Location(628, 477)
	Press_button_location()
	press_location_tmp = Location(720, 640)
	Press_button_location()
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end




end

--Турнир галактики
function Turnir_galaktiki()  --/+/ Улучшены нажатия

toast("'Турнир галактики' ("..(x + 1).." из "..z..") заданий")

tg = 0

local arena_main = Region(1015, 653, 52, 62)
local arena_right = Region(687, 129, 363, 492)
local vyzov_turnir_loc = Region(304, 479, 662, 71)


	region_button_tmp = arena_main
	button_press_tmp = "Arena_first.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()
	

break_repeat = 1
while not arena_right:exists("Turnir_second.png") do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

--Free_hody_turnir = Region(570, 684, 30, 20)
if not arena_right:exists("max_hody_turnir.png") then
	x = x + 1
	cbValue50 = false
	Exit()
	return
end

local karma = find("max_hody_turnir.png")
--local preSimilar = Settings:get("MinSimilarity")
--    Settings:set("MinSimilarity", 0.95)
local Free_hody_turnir = Region(karma:getX() - karma:getW(),karma:getY(), karma:getW(), karma:getH())
--Free_hody_turnir:highlight(1)
--Settings:set("MinSimilarity", preSimilar)


    

--Free_hody_turnir = Region(856, 570, 29, 19)
local Hody_t = numberOCRNoFindException(Free_hody_turnir,"otryad")



--toast(Hody_t)
wait(1)

if (Hody_t < 3) and (Hody_t > 30) then
	Exit()
	--existsClick("exit2.png", 60)
	
	return
	
end

--
region_button_tmp = arena_right
button_press_tmp = "Turnir_second.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()


--wait(5)

local Turnir_loc1 = Region(509, 68, 256, 89)
if Turnir_loc1:exists("zapis_bitvy.png", 5) then
	button_press_tmp = "exit1.png"
	Press_button_one_easy()
end

wait(3)


n = math.floor((Hody_t/3))

if n > 10 then
	n = 10
end

for i = 1, n do
--toast("Ход " ..i.. " из " .. n)
wait(2)

Find_soperniki()

if tg == -1 then
	Exit()
	return
end

Find_one_or_two()

if h == 2 then
	Find_otryad_wes()
	Raschet_sopernikov()
	Srajenie_v_turnire()
	--wait(5)
end


if h == 1 then
	----toast("!")
	region_button_tmp = vyzov_turnir_loc
	button_press_tmp = "Vyzov_turnir.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	Srajenie_v_turnire()
	--wait(5)
end


end







wait(3)

--Сбор наград в Турнире
--local Sbor_nagrad_turnir = Region(269, 634, 37, 32)
press_location_tmp = Location(215, 670)
Press_button_location()
--wait(5)

break_repeat = 1
while existsClick("Kollekciya.png", 10) do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

if last_crash_game == 0 then
	x = x + 1
	if finish == "Остановиться" then
		cbValue50 = false
	end
end
	
Exit()
	
end

--Небесный портал
function Nebesniy_portal()  --/+/ Улучшены нажатия


if (t_np:check() < t_np_max) and (t_np_first == 0) then
	return
end


local nebesniy_portal_main = Region(588, 54, 178, 118)
local nebesniy_portal_left = Region(281, 268, 276, 301)
local nebesniy_portal_right = Region(766, 262, 276, 301)


region_button_tmp = nebesniy_portal_main
button_press_tmp = "Nebesniy_Portal.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()



local np_next_loc = Region(1086, 155, 89, 485)
local exit_loc = Region(966, 0, 314, 302)
local np_nujno_kupit_eshe_loc = Region(5, 173, 1265, 25)


break_repeat = 1
while not exists("np_plus.png") do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end




NP_sbor()


if np_next_loc:exists("np_next.png") then
	break_repeat = 1
	while np_next_loc:exists("np_next.png") do

		local loc_left = Location(700, 400)
		local loc_right = Location(1030, 370)
		local move = {
		{ action = "touchDown", target = loc_right },
		{ action = "wait", target = 1 },
		{ action = "touchMove", target = loc_left },
		{ action = "touchUp", target = loc_left },
		}

		setManualTouchParameter(3, 10)
		manualTouch(move)
		wait(2)

		
		NP_sbor()
		
		
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
end



Exit()

t_np:set()
t_np = Timer()

end


function NP_sbor()

local np_find_free_loc = Region(62, 501, 1067, 32)
local np_podtverdit_loc = Region(672, 480, 228, 61)
local exit_loc = Region(966, 0, 314, 302)

break_repeat = 1
while np_find_free_loc:exists((Pattern"Nebesniy_Portal_find.png"):similar(0.85)) do
	
	--np_find_free_loc:highlight(3)
	
	region_button_tmp = np_find_free_loc
	button_press_tmp = "Nebesniy_Portal_find.png"
	--pause_press_button = 5
	--pause_close_button = 5
	Press_button_one()
	
	
	local karma = find("np_nujno_kupit_eshe.png")
	local nke = Region(karma:getX() + karma:getW(), karma:getY() - 3, 31, karma:getH() + 3)
	local np_tmp_loc = Region(karma:getX() - 10, karma:getY() - 22, 325, 490)
	np_eshe = numberOCRNoFindException(nke, "otryad_small_")
	
	
	
	--toast(np_eshe)
	
	if np_eshe ~= 1 then
		--toast("4")
		--np_tmp_loc:highlight(3)
		region_button_tmp = np_tmp_loc
		button_press_tmp = "besplatno.png"
		Press_button_two()
			
		--np_podtverdit_loc:highlight(3)
		region_button_tmp = np_podtverdit_loc
		button_press_tmp = "Podtverdit.png"
		--pause_press_button = 5
		--pause_close_button = 5
		Press_button_two()
	end
		
	if np_eshe == 1 then
		--toast("2")
		region_button_tmp = np_tmp_loc
		button_press_tmp = "besplatno.png"
		Press_button_two()
		
		break_repeat = 1
		while np_podtverdit_loc:exists("Podtverdit.png") do
			region_button_tmp = exit_loc
			button_press_tmp = "exit1.png"
			--pause_press_button = 5
			--pause_close_button = 5
			Press_button_one()
			region_button_tmp = np_podtverdit_loc
			button_press_tmp = "Podtverdit.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()

			wait(1)
				
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
				
		end
	end
		
	if waitVanish("Podtverdit.png") and np_tmp_loc:exists("np_nujno_kupit_eshe.png") then
		--toast("1")
		--nke:highlight(3)
		press_location_tmp = nke
		Press_button_location()
	end
		

		--toast("end")
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
		
end

end




--Собирает бесплатные кредиты с карты
function Sbor_everyday_credits()  --/+/ Улучшены нажатия

check_quests_stat_yes = 70
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

toast("'Карта на месяц' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

local kredity_plus_loc = Region(437, 35, 107, 33)
local kredity_plus_loc_on = Location(520, 45)
local poluchit_karty = Region(1036, 110, 29, 26)
local poluchit_kredity_loc = Region(134, 481, 980, 65)

 
r, g, b = getColor(kredity_plus_loc_on)
if r > 200 and g < 100 then
	----toast("yes!")
	
	region_button_tmp = kredity_plus_loc
	button_press_tmp = "kredity_plus.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	
	break_repeat = 1
	while poluchit_karty:existsClick("Karta_na_mesyac.png", 15) do
		
		region_button_tmp = poluchit_kredity_loc
		button_press_tmp = "Poluchit_kredity.png"
		--pause_press_button = 5
		--pause_close_button = 5
		
		Press_button_two()

		wait(1)
		
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end

	if last_crash_game == 0 then
		x = x + 1
		cbValue70 = false
		check_quests_stat_no = 1
		Save_new_quests_stat()
	end
	
	Exit()
	
end
	----toast("no")
	
if last_crash_game == 0 then
	x = x + 1
	cbValue70 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end

end

--Исчет и покупает пакет за 1 кредит
function Poisk_paketa()

check_quests_stat_yes = 80
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

local loc_left = Location(80, 400)
local loc_right = Location(1160, 402)
local move = {
{ action = "touchDown", target = loc_right },
{ action = "wait", target = 1 },
{ action = "touchMove", target = loc_left },
{ action = "touchUp", target = loc_left },
}
local random_paket_1_loc = Region(97, 167, 1082, 492)

toast("'Ежедневный пакет' ("..(x + 1).." из "..z..") заданий")

--wait(2)
if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end




button_press_tmp = "Magazin.png"
Press_button_one_easy()

wait(5)
k = 1
l = 1
for i = 1, 18 do



if random_paket_1_loc:exists("Random_paket1.png") then
		target = find("random_paket.png")
		target_pak = Region((target:getX() + 30), (target:getY() + 90), target:getW(), target:getH())
		click(target_pak)
		
		


		----toast("Nashel Paket")
		--existsClick("Random_paket.png", 15)
		button_press_tmp = "yes.png"
		Press_button_one_easy()
		
		wait(5)
		----toast("Vyhodim raz kupili")
		
		if last_crash_game == 0 then
			x = x + 1
			cbValue80 = false
			check_quests_stat_no = 1
			Save_new_quests_stat()
		end
		
		Exit()
		return
end
		
local next_poisk_paketa_loc = Region(1175, 360, 86, 90)

if next_poisk_paketa_loc:exists("next_poisk_paketa.png") then

	setManualTouchParameter(3, 10)
	manualTouch(move)

	wait(3)	
end

if not next_poisk_paketa_loc:exists("next_poisk_paketa.png") then
	k = k - 1
		if k < 0 then
			if last_crash_game == 0 then
				x = x + 1
				cbValue80 = false
				check_quests_stat_no = 1
				Save_new_quests_stat()
			end

			Exit()

			return
		end
end


end


	if last_crash_game == 0 then
		x = x + 1
		cbValue80 = false
		check_quests_stat_no = 1
		Save_new_quests_stat()
	end

Exit()

end

--Собирает ВСЕ бонусы на вкладке бонусы
function Bonus()


if true then
	x = x + 1
	cbValue90 = false
	return
end

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

button_1 = Location(330, 193)
button_2 = Location(330, 300)
button_3 = Location(330, 409)
button_4 = Location(330, 515)
button_5 = Location(330, 620)
button_55 = Location(330, 250)
button_6 = Location(330, 357)
button_7 = Location(330, 464)
button_8 = Location(330, 571)


button_10 = Location(582, 270)
button_20 = Location(755, 270)
button_30 = Location(925, 270)
button_40 = Location(1098, 270)

button_20_m = Location(763, 270)
button_30_m = Location(933, 270)
button_40_m = Location(1108, 270)


bonus_location = Region(1245, 109, 29, 29)
bonus_location_2 = Region(806, 117, 344, 25)
quests_loc = Region(313, 162, 41, 526)
quests_farm = Region(949, 255, 186, 198)
quests2_farm = Region(533, 247, 610, 46)
bonus_podarok = Region(546, 157, 559, 82)
wait_bonus_loc = Region(676, 0, 89, 84)
wait_location_2 = Location(354, 207)

exit_loc = Region(927, 0, 353, 141)
bns_step = 1

toast("'Бонусы' ("..(x + 1).." из "..z..") заданий")

while bonus_location:exists("test3.png") do
	region_button_tmp = bonus_location
	button_press_tmp = "test3.png"
	Press_button_one()
	--bonus_location:highlight(2)
	--toast(bns_step..":"..break_repeat)
	
	if bns_step > 3 then
		break
	end
	
	
	while bonus_location_2:exists("test3.png") do
		--bonus_location_2:highlight(2)
		region_button_tmp = bonus_location_2
		button_press_tmp = "test3.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()

		
		--while not wait_bonus_loc:exists("wait_bonus.png") do
		break_repeat = 1
		while not bonus_podarok:exists("Bonus_podarok_up.png") do
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		end
		
		--toast("Nachinaem...")
		
		
		button_ok = 0
		
		Bonus_second_menu()
		
		r11, g11, b11 = getColor(button_2)
		wait(0.021)
		r1, g1, b1 = getColor(button_2)
		if r1 ~= r11 then
			
			
			press_location_tmp = button_2
			Press_button_location()

			Bonus_second_menu()
			button_ok = 1
		end


		r11, g11, b11 = getColor(button_3)
		wait(0.021)
		r1, g1, b1 = getColor(button_3)
		if r1 ~= r11 then
			
			press_location_tmp = button_3
			Press_button_location()
			
			Bonus_second_menu()
			button_ok = 1
		end


		r11, g11, b11 = getColor(button_4)
		wait(0.021)
		r1, g1, b1 = getColor(button_4)
		if r1 ~= r11 then
			
			press_location_tmp = button_4
			Press_button_location()
			
			Bonus_second_menu()
			button_ok = 1
		end
		
		
		r11, g11, b11 = getColor(button_5)
		wait(0.021)
		r1, g1, b1 = getColor(button_5)
		if r1 ~= r11 then
			
			press_location_tmp = button_5
			Press_button_location()
			
			Bonus_second_menu()
			button_ok = 1
		end
		
		
		r11, g11, b11 = getColor(button_1)
		wait(0.021)
		r1, g1, b1 = getColor(button_1)
		if r1 ~= r11 then
			
			press_location_tmp = button_1
			Press_button_location()
			
			Bonus_second_menu()
			button_ok = 1
		end
		
		
		bonus_down_loc = Region(188, 648, 100, 33)
		if bonus_down_loc:exists("bonus_down.png") then
		
			local loc_up = Location(240, 160)
			local loc_down = Location(245, 575)
			local move = {
			{ action = "touchDown", target = loc_down },
			{ action = "wait", target = 1 },
			{ action = "touchMove", target = loc_up },
			{ action = "touchUp", target = loc_up },
			}
			
			break_repeat = 1
			while bonus_down_loc:exists("bonus_down.png") do
				setManualTouchParameter(5, 1)
				manualTouch(move)
				wait(1)
				setManualTouchParameter(5, 1)
				manualTouch(move)
				wait(1)
				
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
				
			end
			
			
				r11, g11, b11 = getColor(button_55)
				wait(0.021)
				r1, g1, b1 = getColor(button_55)
				--toast("5"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
				if r1 ~= r11 then
					--toast("5"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
					press_location_tmp = button_55
					Press_button_location()
					
					Bonus_second_menu()
					button_ok = 1
				end
				
				r11, g11, b11 = getColor(button_6)
				wait(0.021)
				r1, g1, b1 = getColor(button_6)
				--toast("6"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
				if r1 ~= r11 then
					--toast("6"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
					press_location_tmp = button_6
					Press_button_location()
					
					Bonus_second_menu()
					button_ok = 1
					
					setManualTouchParameter(5, 1)
					manualTouch(move)
					wait(3)
				end
			
				r11, g11, b11 = getColor(button_7)
				wait(0.021)
				r1, g1, b1 = getColor(button_7)
				--toast("7"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
				if r1 ~= r11 then
					--toast("7"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
					press_location_tmp = button_7
					Press_button_location()
					
					Bonus_second_menu()
					button_ok = 1
					
					setManualTouchParameter(5, 1)
					manualTouch(move)
					wait(3)
				end
			
				r11, g11, b11 = getColor(button_8)
				wait(0.021)
				r1, g1, b1 = getColor(button_8)
				--toast("8"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
				if r1 ~= r11 then
					--toast("8"..r1..":"..r11..":"..g1..":"..g11..":"..b1..":"..b11)
					press_location_tmp = button_8
					Press_button_location()
				
					Bonus_second_menu()
					button_ok = 1
					
				end
			
		end
		
		
	
	end
	
	exit3_loc = Region(920, 0, 357, 170)
	if exit3_loc:exists("exit1.png") then
		
		region_button_tmp = exit3_loc
		button_press_tmp = "exit1.png"
		
		Press_button_two()
		
	end
	
	--bonus_location:existsClick("test3.png")
	
	bns_step = bns_step + 1
	
end

if last_crash_game == 0 then
	x = x + 1
	cbValue90 = false
end

--toast(bns_step)
Exit()

end

--Получаем бонусы нажимая на кнопку "Получить"
function Bonus_poluchit()

break_repeat = 1

while quests_farm:exists("Poluchit_bonus.png") do
	
	region_button_tmp = quests_farm
	button_press_tmp = "Poluchit_bonus.png"
	
	Press_button_one()
	
	
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

end



--Сбор бонусов во вкладках и проверка ящика сверху
function Bonus_second_menu()



bonus_ochki_nnada_loc = Region(446, 301, 56, 72)
break_repeat = 1
t_break_repeat = 120
while not bonus_ochki_nnada_loc:exists("bonus_ochki_nnada.png") do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end


bon = find("bonus_ochki_nnada.png")
--print(bon:getY())

Bonus_poluchit()

if bon:getY() > 630 then

	r, g, b = getColor(button_10)
	--print(r.." "..g.." "..b)
	r1, g1, b1 = getColor(button_20)
	--print(r1.." "..g1.." "..b1)
	--print((((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3))
	if (((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3) < 0.8 then

		click(button_20)
		Bonus_poluchit()
		wait(1)
	end
		
	r1, g1, b1 = getColor(button_30)
	--print(r1.." "..g1.." "..b1)
	--print((((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3))
	if (((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3) < 0.8 then
		
		click(button_30)
		Bonus_poluchit()
		wait(1)
	end
		
	r1, g1, b1 = getColor(button_40)
	--print(r1.." "..g1.." "..b1)
	--print((((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3))
	if (((math.min(r, r1) / math.max(r, r1)) + (math.min(g, g1) / math.max(g, g1)) + (math.min(b, b1) / math.max(b, b1))) / 3) < 0.8 then
		
		click(button_40)
		Bonus_poluchit()
		
	end
		
		
		
		
		
		
else
	
	Bonus_poluchit()
	
end

	







test3 = regionFindAll(bonus_podarok, Pattern("Bonus_podarok_up.png"):similar(0.7))


for i, m in ipairs(test3) do
	r11, g11, b11 = getColor(m)
	wait(0.021)
	r1, g1, b1 = getColor(m)
	if r1 ~= r11 then
		
		press_location_tmp = m
		Press_button_location()
			
		wait(0.5)
		press_location_tmp = Location(630, 20)
		Press_button_location()
			
	end
	
	--
end



end


--Собирает выданные награды
function Moi_nagrady()  --/+/ Улучшены нажатия

local mn_menu_1 = Region(1230, 14, 19, 20)
local mn_menu_2 = Region(868, 95, 21, 21)
local Poluchit_all_loc = Region(544, 647, 188, 39)
local Nagrady_menu_loc = Region(1159, 5, 112, 62)
local Nagrady_menu2_loc = Region(792, 81, 109, 107)
--local exit_loc = Region(927, 0, 353, 141)

toast("'Мои награды' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end




if mn_menu_1:existsClick("Karta_na_mesyac.png", 10) then
	if mn_menu_2:existsClick("Karta_na_mesyac.png", 10) then
		
		region_button_tmp = Poluchit_all_loc
		button_press_tmp = "Poluchit_all.png"
		--pause_press_button = 5
		--pause_close_button = 5
		Press_button_one()
		
		Exit()
		
	elseif not Nagrady_menu2_loc:exists((Pattern"Nagrady_menu2.png"):similar(0.99)) then
		Nagrady_menu_loc:existsClick("Nagrady_menu1.png", 20)
	end

end


if last_crash_game == 0 then
	x = x + 1
	cbValue100 = false
end

end



--Проходит бесконечный космос
function Bk_fight()  --/+/ Улучшены нажатия

local sbros_loc = Region(459, 556, 419, 152)
local srajenie_loc = Region(557, 300, 176, 108)
local wait_location = Region(1132, 0, 148, 54)
local free_hody_bk_loc = Region(11, 112, 190, 44)
local finish_bk_loc = Region(589, 280, 291, 109)
local player_loc = Region(413, 254, 136, 217)

--local beskonechniy_kosmos_sub_loc = Region(897, 1, 266, 53)

bk_fight = 0
bk_fh = (regionFindAllNoFindException(free_hody_bk_loc, ("free_hody_bk.png")))
bk_hody = table.getn(bk_fh)



--toast(bk_hody..":"..bk_expedition_sbros..":"..sbros_expedition_yes)
--break_repeat = 1
while bk_hody > 0 do

----toast(bk_hody)

	if ((bk_expedition_sbros == 1) and (sbros_expedition_yes == 1) and (bk_hody < 2)) then
		----toast("вынужден вернуться")
		return
	end		
	
	if not (finish_bk_loc:exists("finish_bk.png")) then
		press_location_tmp = player_loc
		Press_button_location()
		

		region_button_tmp = srajenie_loc
		button_press_tmp = "Srajenie.png"
		--pause_press_button = 5
		--pause_close_button = 5
		Press_button_two()
		
		bk_fight = bk_fight + 1
		----toast("srajenie")
		wait(3)
		Propustit()
		
		if wait_location:exists("arena_wait.png") then
			break_repeat = 1
			while wait_location:exists("arena_wait.png") do
				wait(2)
				------toast("wait end")
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
			end
		end
			
		Dalee()
							
							--bk_hody = bk_hody - 1
							----toast(bk_hody)
	else
		return
	end
						
						--if finish_bk_loc:exists("finish_bk.png", 5) then
						--	return
						--end
						--sbros_loc:highlight(5)
	break_repeat = 1
	while not (sbros_loc:exists("bk_sbros.png") or sbros_loc:exists("bk_sbros_ograbit.png")) do
		wait(1)
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
						
		bk_fh = (regionFindAllNoFindException(free_hody_bk_loc, ("free_hody_bk.png")))
		bk_hody = table.getn(bk_fh)
						
end

end

--Собирает награды в бесконечном космосе
function Bk_nagrady()  --/+/ Улучшены нажатия

local bk_nagrady_loc2 = Region(960, 91, 178, 557)
local bk_nagrady_loc = Region(1251, 111, 20, 240)
local bk_sbor_poluchit_nagradu_loc = Region(686, 562, 190, 62)
local podtverdit_loc = Region(487, 528, 289, 70)
local exit_loc = Region(927, 0, 353, 141)

if bk_sbor_poluchit_nagradu_loc:existsClick("bk_sbor_poluchit_nagradu.png") then
	bk_sbor_poluchit_nagradu_loc:waitVanish("bk_sbor_poluchit_nagradu.png")
	
	region_button_tmp = podtverdit_loc
	button_press_tmp = "Podtverdit.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()
	
end

break_repeat = 1
while bk_nagrady_loc:exists("test3.png") do
	
	region_button_tmp = bk_nagrady_loc
	button_press_tmp = "test3.png"
	
	Press_button_two()
	
	
	
	poluchit = 0
	break_repeat = 1
	while bk_nagrady_loc2:exists("Poluchit.png") do
	
		region_button_tmp = bk_nagrady_loc2
		button_press_tmp = "Poluchit.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()
		poluchit = poluchit + 1
		Break_repeat()
		if stop_break_repeat == 1 or poluchit >= 4 then
			poluchit = 0
			break
		end
		
	end	
		
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	
end
end

--Сброс в бесконечном космосе
function Bk_sbros()  --/+/ Улучшены нажатия
----toast("Проверяем / делаем сброс")
--sbros_expedition_yes = 0
sbros = 1
sbros_yes = 0
local sbros_loc = Region(469, 557, 186, 137)
local bk_sbros_loc_yes_no = Region(549, 627, 18, 21)
local bk_sbros_exp_loc_yes_no = Region(549, 682, 18, 21)
local bk_sbros_loc = Region(459, 560, 193, 137)
local bk_sbros_ograbit_loc = Region(680, 557, 204, 72)
local yes_loc = Region(464, 357, 411, 205)
local bk_ostanovit_nabeg_loc = Region(445, 534, 449, 170)
local bk_sbor_poluchit_nagradu_loc = Region(686, 562, 190, 62)
	
if sbros_loc:exists("bk_sbros.png") then
----toast("knopka est")
	if bk_expedition_sbros == 1 then
		sbros = numberOCRNoFindException(bk_sbros_exp_loc_yes_no,"otryad")
		sbros_expedition_yes = 0
	end
	if bk_expedition_sbros == 0 then
		sbros = numberOCRNoFindException(bk_sbros_loc_yes_no,"otryad")
		
	end
end


if bk_sbros_loc:exists("bk_sbros.png") and (sbros == 1) then
	
	region_button_tmp = bk_sbros_loc
	button_press_tmp = "bk_sbros.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	sbros_yes = 1
	region_button_tmp = yes_loc
	button_press_tmp = "yes.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()
	
	if bk_expedition_sbros == 1 then
		return
	end
	
	region_button_tmp = bk_sbros_ograbit_loc
	button_press_tmp = "bk_sbros_ograbit.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()
	
	wait(3)
	
	break_repeat = 1
	while bk_ostanovit_nabeg_loc:exists("bk_ostanovit_nabeg.png") do
		wait(1)
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end

	region_button_tmp = bk_sbor_poluchit_nagradu_loc
	button_press_tmp = "bk_sbor_poluchit_nagradu.png"
	--pause_press_button = 180
	--pause_close_button = 5

	Press_button_two()

	podtverdit_loc = Region(487, 528, 289, 70)
	
	region_button_tmp = podtverdit_loc
	button_press_tmp = "Podtverdit.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

end

end

--Проходит бесконечный космос
function Beskonechniy_kosmos()  --/+/ Улучшены нажатия


check_quests_stat_yes = 110
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

nagrady_stat = 0
fight_stat = 0


local Beskonechniy_kosmos_KVIP = 1
local Beskonechniy_kosmos_SUM = 1
local Beskonechniy_kosmos_OTHER = 1
local Beskonechniy_kosmos_REZERV = 1


local laba_loc = Region(1016, 0, 84, 58)
local koridor_loc = Region(378, 177, 547, 329)
local free_hody_bk_loc = Region(11, 112, 190, 44)
local player_loc = Region(413, 254, 136, 217)
local dalee_loc = Region(1008, 266, 185, 207)
local finish_bk_loc = Region(589, 280, 291, 109)
local sbros_loc = Region(459, 556, 419, 152)
local beskonechniy_kosmos_loc = Region(150, 101, 578, 499)
local exit_loc = Region(927, 0, 353, 141)
local exp_bonus_loc = Region(362, 522, 587, 53)

bk_expedition_sbros = 0
sbros_expedition_yes = 1

toast("'Бесконечный космос' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

region_button_tmp = laba_loc
button_press_tmp = "laba.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

region_button_tmp = beskonechniy_kosmos_loc
button_press_tmp = "beskonechniy_kosmos.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

for bk = 1, 5 do

	if (Beskonechniy_kosmos_KVIP == 1) then
		if (koridor_loc:exists("koridor.png")) then
	----toast("KVIP")	
		
		region_button_tmp = koridor_loc
		button_press_tmp = "koridor.png"
			--pause_press_button = 5
			--pause_close_button = 5

		Press_button_two()

			
		Beskonechniy_kosmos_KVIP = 0
			
	
		
		break_repeat = 1
		while not exists("magazin.png") do
			wait(1)
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		
		end
		
		Bk_fight()
		bk_fight_kor = bk_fight
		Bk_nagrady()

		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()


		if bk_fight_kor > 0 then
			if beskonechniy_kosmos_loc:exists("beskonechniy_kosmos.png") then
			
				region_button_tmp = beskonechniy_kosmos_loc
				button_press_tmp = "beskonechniy_kosmos.png"
				--pause_press_button = 5
				--pause_close_button = 5

				Press_button_two()
			
			end
		end

		
	end
end		

	if (Beskonechniy_kosmos_SUM == 1) then
		if (koridor_loc:exists("suma.png")) then
--		--toast("SUMA")
		
		region_button_tmp = koridor_loc
		button_press_tmp = "suma.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()

		
		Beskonechniy_kosmos_SUM = 0
		
		break_repeat = 1
		while not exists("bk_sbros.png") do
			wait(1)
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		
		end
		
		Bk_nagrady()
		Bk_fight()
		bk_fight_suma = bk_fight
		Bk_sbros()
		Bk_nagrady()

		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		
		if bk_fight_suma > 0 then
			if beskonechniy_kosmos_loc:exists("beskonechniy_kosmos.png") then
			
				region_button_tmp = beskonechniy_kosmos_loc
				button_press_tmp = "beskonechniy_kosmos.png"
				--pause_press_button = 5
				--pause_close_button = 5

				Press_button_two()
			
			end
		end
		

		
	end
	end

	if (Beskonechniy_kosmos_OTHER == 1) then
		if (koridor_loc:exists("chervotoch.png")) then
--		--toast("OTHER")
		
		region_button_tmp = koridor_loc
		button_press_tmp = "chervotoch.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()

		
		Beskonechniy_kosmos_OTHER = 0
	
		break_repeat = 1
		while not exists("bk_sbros.png") do
			wait(1)
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		
		end
		
		Bk_nagrady()
		Bk_fight()
		bk_fight_che = bk_fight
		Bk_nagrady()
		Bk_sbros()
		Bk_nagrady()
		
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		
		if bk_fight_che > 0 then
			if beskonechniy_kosmos_loc:exists("beskonechniy_kosmos.png") then
			
				region_button_tmp = beskonechniy_kosmos_loc
				button_press_tmp = "beskonechniy_kosmos.png"
				--pause_press_button = 5
				--pause_close_button = 5

				Press_button_two()
			
			end
		end
		

		
	end
	end
	
	if (Beskonechniy_kosmos_REZERV == 1) then
		if (koridor_loc:exists("bk_expedition.png")) then
--		--toast("EXPEDITION")
		
		region_button_tmp = koridor_loc
		button_press_tmp = "bk_expedition.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()

		
		Beskonechniy_kosmos_REZERV = 0
		bk_expedition_sbros = 1
		
		break_repeat = 1
		while not exists("bk_sbros.png") do
			wait(1)
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		
		end
		
		
		Bk_fight()
		bk_fight_exp = bk_fight_exp + bk_fight
		Bk_sbros()
		Bk_fight()
		bk_fight_exp = bk_fight_exp + bk_fight
		bk_expedition_sbros = 0
		
		if exp_bonus_loc:exists("Bonus_podarok_up.png") then
			test3 = regionFindAll(exp_bonus_loc, Pattern("Bonus_podarok_up.png"):similar(0.7))
			for i, m in ipairs(test3) do
				--print(m)
				r11, g11, b11 = getColor(m)
				wait(0.021)
				r1, g1, b1 = getColor(m)
				if r1 ~= r11 then
					
					--toast("est sunduk!")
					
					press_location_tmp = m
					Press_button_location()
					
					wait(3)
					
					press_location_tmp = Location(630, 20)
					Press_button_location()
					
				end
		
		
			end
		end
		
		exit_loc = Region(927, 0, 353, 141)
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		
		if bk_fight_exp > 0 then
			if beskonechniy_kosmos_loc:exists("beskonechniy_kosmos.png") then
			
				region_button_tmp = beskonechniy_kosmos_loc
				button_press_tmp = "beskonechniy_kosmos.png"
				--pause_press_button = 5
				--pause_close_button = 5

				Press_button_two()
			
			end
		end
		

		
	end
	end

press_location_tmp = dalee_loc
Press_button_location()

wait(3)
end

if last_crash_game == 0 then
	x = x + 1
	cbValue110 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end


Exit()

end

--Проходит хаотичный космос
function Haotichniy_kosmos()

check_quests_stat_yes = 150
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

local hk_poisk_loc = Region(7, 5, 1263, 705)
local haotichnuy_kosmos = Region(455, 447, 267, 143)
local haotichnuy_kosmos_main_loc = Region(916, 8, 229, 31)
local hk_podtverdit_loc = Region(543, 609, 199, 78)
local hk_bonus_3_loc = Region(542, 283, 195, 205)
local hk_remont_loc = Region(445, 19, 195, 74)
local hk_remont_limit_loc = Region(11, 13, 41, 78)
local hk_remont_1_loc = Region(20, 177, 48, 24)
local hk_remont_2_loc = Region(143, 177, 48, 24)
local hk_remont_3_loc = Region(268, 177, 48, 24)
local hk_remont_4_loc = Region(391, 177, 48, 24)
local hk_remont_5_loc = Region(516, 177, 48, 24)
local hk_shchet1_loc = Region(813, 619, 327, 98)
local hk_priz_loc = Region(1161, 610, 97, 96)

local hk_korabli = 3
local hk_priz = 0
local hk_lose = 0
local hk_attempt = 4

local laba_loc = Region(1016, 0, 84, 58)
local haotichnuy_kosmos_stroy_loc = Region(643, 483, 207, 82)
local hk_dalee_loc = Location(1154, 468)
local srajenie_loc = Region(557, 300, 176, 108)
local wait_location = Region(1132, 0, 148, 54)

local exit_loc = Region(927, 0, 353, 141)

toast("'Хаотичный космос' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

region_button_tmp = laba_loc
button_press_tmp = "laba.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

region_button_tmp = haotichnuy_kosmos
button_press_tmp = "haotichnuy_kosmos.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

break_repeat = 1
while not haotichnuy_kosmos_main_loc:exists("haotichnuy_kosmos_main.png") do

	region_button_tmp = haotichnuy_kosmos_stroy_loc
	button_press_tmp = "podtverdit_hk.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

break_repeat = 1
while not (hk_shchet1_loc:exists("hk_shchet0.png") or hk_shchet1_loc:exists("hk_shchet1.png")) do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

hkk = (regionFindAllNoFindException(hk_shchet1_loc, ("hk_shchet1.png")))
hk_korabli = table.getn(hkk)

--break_repeat = 1
while (hk_korabli > 0) do
	--toast(hk_korabli)
	if hk_poisk_loc:exists("hk_cel.png") then
		target = find("hk_cel.png")
		target_cel = Region(target:getX() - 108, target:getY() + 15, 2, 2)
		
		long_click_time = 0.1
		press_location_tmp = target_cel
		Press_button_location()
		
		region_button_tmp = srajenie_loc
		button_press_tmp = "Srajenie.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_two()
		
		hk_attempt = hk_attempt - 1
		wait(3)
		
		Propustit()
		
		if wait_location:exists("arena_wait.png") then
			break_repeat = 1
			while wait_location:exists("arena_wait.png") do
				wait(2)
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
			end
		end
		
		Dalee()
		
		if hk_korabli == 1 and hk_bonus_3_loc:exists("Dostupny_nagrady.png") then
			wait(2)
			
			hk_attempt = 4
			region_button_tmp = hk_bonus_3_loc
			button_press_tmp = "Dostupny_nagrady.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_two()

			wait(2)
			region_button_tmp = hk_podtverdit_loc
			button_press_tmp = "Podtverdit.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_two()

			wait(2)
		end
	
		hkk = (regionFindAllNoFindException(hk_shchet1_loc, ("hk_shchet1.png")))
		hk_korabli = table.getn(hkk)
		
		if hk_attempt == 0 then
			hk_korabli = 0
		end
		
		if not (hk_korabli == 0) then
		
			region_button_tmp = hk_remont_loc
			button_press_tmp = "hk_remont.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()

			wait(2)
			
			continueClick(hk_remont_1_loc, 5, math.random(25, 45))
			continueClick(hk_remont_2_loc, 5, math.random(25, 45))
			continueClick(hk_remont_3_loc, 5, math.random(25, 45))
			continueClick(hk_remont_4_loc, 5, math.random(25, 45))
			continueClick(hk_remont_5_loc, 5, math.random(25, 45))

			region_button_tmp = hk_remont_loc
			button_press_tmp = "hk_remont.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()
				
			wait(2)

		end					
	
	else
		long_click_time = 0.01
		press_location_tmp = hk_dalee_loc
		Press_button_location()

		wait(5)
	


	--[[if not hk_poisk_loc:exists("hk_cel.png") and hk_korabli > 0 then
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()]]
	end
	
	
end

if last_crash_game == 0 then
	x = x + 1
	cbValue150 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end

Exit()

end

--Жертвует в альянс, учавствует в экспедиции
function Alyans()

check_quests_stat_yes = 25
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end


local alyans_main_loc = Region(1097, 639, 83, 81)

toast("'Альянс' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end



button_press_tmp = "alyans_main.png"
Press_button_one_easy()

button_press_tmp = "alyans_funkciya.png"
Press_button_one_easy()


local alyans_dop_bonus_loc = Region(210, 296, 397, 119)
local expedition_loc = Region(660, 296, 397, 119)
local krepost_loc = Region(210, 421, 410, 143)
local perestroenie_loc = Region(654, 431, 405, 125)
local alyans_vznos_loc = Region(320, 91, 228, 39)
local alyans_vznos_loc2 = Region(257, 409, 285, 60)
local exit_loc3 = Region(946, 239, 104, 66)
local alyans_dop_bonus_jertva_0 = Region(117, 556, 319, 65)
local exit_loc = Region(927, 0, 353, 141)
local alyans_dop_bonus_jertva_5 = Region(479, 552, 320, 71)
local alyans_dop_bonus_jertva_50 = Region(839, 555, 318, 66)
a1 = 0
a2 = 0
a3 = 0
a4 = 0

if alyans_dop_bonus_loc:exists((Pattern"alyans_on.png"):similar(0.95), 3) then
	a1 = 1
end
if expedition_loc:exists((Pattern"alyans_on.png"):similar(0.95), 3) then
	a2 = 1
end
if krepost_loc:exists((Pattern"alyans_on_light.png"):similar(0.95), 3) then
	a3 = 1
end
if (cbValue26) then
	if perestroenie_loc:exists((Pattern"alyans_on.png"):similar(0.95), 3) then
		a4 = 1
	end
end







if a1 == 1 then
--alyans_dop_bonus_loc:highlight(2)
	
	button_press_tmp = "alyans_dop_bonus.png"
	Press_button_one_easy()
	
	if dop_bonus == "0 кредитов" then
		
		region_button_tmp = alyans_dop_bonus_jertva_0
		button_press_tmp = "jertvovat.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

	end
	if dop_bonus == "5 кредитов" then

		region_button_tmp = alyans_dop_bonus_jertva_5
		button_press_tmp = "jertvovat5-50.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		button_press_tmp = "yes.png"
		Press_button_one_easy()
		
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()
	end
	if dop_bonus == "50 кредитов" then
		
		region_button_tmp = alyans_dop_bonus_jertva_50
		button_press_tmp = "jertvovat5-50.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		button_press_tmp = "yes.png"
		Press_button_one_easy()
		
		region_button_tmp = exit_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()
		
	end
	
end


if a2 == 1 then
	region_button_tmp = expedition_loc
	button_press_tmp = "expedition.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	button_press_tmp = "uchastvovat.png"
	Press_button_one_easy()
	
	wait(5)
	
	pause_press_button = 30
	button_press_tmp = "pozvat_druzei.png"
	Press_button_one_easy()
	
	wait(5)
	
	region_button_tmp = exit_loc
	button_press_tmp = "exit1.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()
	
end


if a3 == 1 then
	region_button_tmp = krepost_loc
	button_press_tmp = "krepost.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	region_button_tmp = alyans_vznos_loc
	button_press_tmp = "alyans_vznos.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	region_button_tmp = alyans_vznos_loc2
	button_press_tmp = "alyans_vznos.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	wait(5)
	
end
	

if a4 == 1 then
	region_button_tmp = perestroenie_loc
	button_press_tmp = "perestroenie_broni.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	
	local podojdat_uluchsheniya_loc = Region(87, 167, 1132, 383)
	local uluchshit_loc = Region(541, 455, 199, 57)
	local zaprosit_loc = Region(996, 629, 250, 64)
	local mgnov_uskorit_loc = Region(510, 629, 258, 60)
	local pomoch_druzyam_loc = Region(998, 552, 246, 61)
	local exit_loc = Region(927, 0, 243, 141)
	
	if podojdat_uluchsheniya_loc:existsClick("podojdat_uluchsheniya.png") then
		region_button_tmp = uluchshit_loc
		button_press_tmp = "uluchshit.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

		region_button_tmp = zaprosit_loc
		button_press_tmp = "zaprosit.png"
		--pause_press_button = 5
		--pause_close_button = 5

		Press_button_one()

	end

	region_button_tmp = pomoch_druzyam_loc
	button_press_tmp = "pomoch_druzyam.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	region_button_tmp = mgnov_uskorit_loc
	button_press_tmp = "mgnov_uskorit.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	region_button_tmp = exit_loc
	button_press_tmp = "exit1.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

	
	
	
	
end
	
	
	


if last_crash_game == 0 then
	x = x + 1
	cbValue25 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end


Exit()

end

--Перестроение брони
function Perestroenie_broni()

local podojdat_uluchsheniya_loc = Region(87, 167, 1132, 383)
local perestroenie_loc = Region(654, 431, 405, 125)
local alyans_main_loc = Region(1097, 639, 83, 81)
local uluchshit_loc = Region(541, 455, 199, 57)
local zaprosit_loc = Region(996, 629, 250, 64)
local mgnov_uskorit_loc = Region(510, 629, 258, 60)
local pomoch_druzyam_loc = Region(998, 552, 246, 61)
local exit_loc = Region(927, 0, 243, 141)

button_press_tmp = "alyans_main.png"
Press_button_one_easy()

button_press_tmp = "alyans_funkciya.png"
Press_button_one_easy()

region_button_tmp = perestroenie_loc
button_press_tmp = "perestroenie_broni.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

if podojdat_uluchsheniya_loc:existsClick("podojdat_uluchsheniya.png") then

	region_button_tmp = uluchshit_loc
	button_press_tmp = "uluchshit.png"
	--pause_press_button = 5
	--pause_close_button = 5
	Press_button_one()

	region_button_tmp = zaprosit_loc
	button_press_tmp = "zaprosit.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_one()

end

region_button_tmp = pomoch_druzyam_loc
button_press_tmp = "pomoch_druzyam.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

region_button_tmp = mgnov_uskorit_loc
button_press_tmp = "mgnov_uskorit.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

region_button_tmp = exit_loc
button_press_tmp = "exit1.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

Exit()

end

--Проверяет акции
function Akciya()

local akciya_loc = Region(1249, 383, 28, 27)

toast("'Акции' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end



if akciya_loc:exists((Pattern"akciya_on.png"):similar(0.8)) then

	region_button_tmp = akciya_loc
	button_press_tmp = "akciya_on.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

end

if last_crash_game == 0 then
	x = x + 1
	cbValue120 = false
end

Exit()

end

--Проходит боевую подготовку (пока только битва в один клик)
function Boevaya_podgotovka()

check_quests_stat_yes = 130
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end
--wait(5)

local laba_loc = Region(1016, 0, 84, 58)
local Bitva_v_odin_click_loc = Region(507, 623, 195, 72)

toast("'Боевая подготовка' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end



region_button_tmp = laba_loc
button_press_tmp = "laba.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

button_press_tmp = "Boevaya_podgotovka.png"
Press_button_one_easy()


region_button_tmp = Bitva_v_odin_click_loc
button_press_tmp = "Bitva_v_odin_click.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()

wait(5)

if last_crash_game == 0 then
	x = x + 1
	cbValue130 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end

Exit()

end

--Фармит события
function Sobytiya()

check_quests_stat_yes = 140
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

local sobytie_loc = Region(1249, 202, 22, 19)
local Nagrady_vhoda_loc1 = Region(203, 60, 19, 19)
local Nagrady_vhoda_loc2 = Region(407, 60, 19, 19)
local find_galka1 = Region(218, 247, 945, 90)
local find_galka2 = Region(218, 472, 945, 90)
local nedelya_loc = Region(582, 178, 93, 534)
local exit4_loc = Region(1057, 60, 70, 68)
local utverdit_loc = Region(916, 273, 176, 61)

local galka1 = 0
local galka2 = 0

toast("'События' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end


if not (sobytie_loc:existsClick("test3.png")) then
	if last_crash_game == 0 then
		x = x + 1
		cbValue140 = false
		check_quests_stat_no = 1
		Save_new_quests_stat()
	end
	return
end

if existsClick("bonus_blagodarnosti.png", 30) then
	break_repeat = 1
	while utverdit_loc:existsClick("utverdit.png") do
		utverdit_loc:waitVanish("utverdit.png", 5)
		break_repeat = 1
		while exit4_loc:existsClick("exit2.png", 30) do
			exit4_loc:waitVanish("exit2.png", 10)
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		end
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
end

if existsClick("Nagrady_vhoda.png", 5) then
	if nedelya_loc:exists("Nedelya.png", 30) then
	test4 = (regionFindAllNoFindException(find_galka1, ("Sobytie_nagrady_vhoda_yes.png")))
	galka1 = table.getn(test4)
	if galka1 > 6 then
		test5 = (regionFindAllNoFindException(find_galka2, ("Sobytie_nagrady_vhoda_yes.png")))
		galka2 = table.getn(test5)
		
		press_location_tmp = Location((190 + (galka2 * 145)), 530)
		Press_button_location()
			
		
	end
	if galka1 < 7 then
		
		press_location_tmp = Location((190 + (galka1 * 145)), 300)
		Press_button_location()
		
	end
	end

end




if last_crash_game == 0 then
	x = x + 1
	cbValue140 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end

Exit()

end

--Пандора
function Pandora()

if ((t_pand:check()) < t_pand_max) and (t_pand_first == 0) then
	return
end

pandora_vi_poterpeli_porajenie_loc = Region(458, 176, 360, 46)
pandora_vi_poterpeli_porajenie_exit_loc = Region(1020, 138, 105, 75)
Pandora_ataka_loc = Region(482, 649, 94, 28)
Pandora_ataka_exit_loc = Region(1024, 18, 98, 66)
local loc_left = Location(650, 720)
local loc_right = Location(640, 360)
local move = {
{ action = "touchDown", target = loc_right },
{ action = "wait", target = 1 },
{ action = "touchMove", target = loc_left },
{ action = "touchUp", target = loc_left },
}





t_pand_first = 0

--заходим в пандору
click(Location(890, 600)) 
p_ataka = Location(530, 650)
p_status_loc = Region(6, 105, 151, 49)
p_bonus_loc = Region(597, 44, 96, 40)

t_pand:set()
t_pand = Timer()

if pandora_vi_poterpeli_porajenie_loc:exists(Pattern("pandora_vi_poterpeli_porajenie.png"), 10) then
	toast("Еще не воскресли")
	Exit()
	return
elseif p_status_loc:exists("p_marsh.png", 10) then
	toast("Пока летим, соберем награды")
	existsClick("Pandora_poluchit.png", 10)
	if p_bonus_loc:exists("p_bonus.png", 10) then
		toast("Недавно собирали же! Терпение")
		Exit()
		return
	else
		--wait(8)
	end
elseif p_status_loc:exists("p_otdyh.png", 10) then
	toast("Некогда отдыхать, вперед, в бой!!")
	break_repeat = 1
	while not existsClick("Pandora_first.png", 10) do
		toast("Ищем звезду")
		setManualTouchParameter(3, 5)
		manualTouch(move)
		wait(2)
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	
	wait(5)
	
	existsClick("Pandora_first.png")
	toast("Атакуем звезду!")
	click(p_ataka)
	wait(3)
	toast("Выходим")
	Exit()
	return
end

toast("Выходим")

Exit()



end

--Атоулучшение тех оборудования
function Teh_uluchshenie()

menu_issledovatelckiy_centr_loc = Region(31, 65, 810, 33)
autoobnovlenie_loc = Region(346, 438, 184, 65)
up_loc = Region(520, 215, 608, 505)
local autoobnovlenie_target_left = Location(526, 451)
local autoobnovlenie_target_right = Location(780, 451)
local move = {
{ action = "touchDown", target = autoobnovlenie_target_left },
{ action = "wait", target = 1 },
{ action = "touchMove", target = autoobnovlenie_target_right },
{ action = "touchUp", target = autoobnovlenie_target_right },
}
local move2= {
{ action = "touchDown", target = Location(520, 610) },
{ action = "wait", target = 1 },
{ action = "touchMove", target = Location(541, 300) },
{ action = "touchUp", target = Location(541, 300) },
}


button_press_tmp = "dostupno_teh_uluchshenie.png"
Press_button_one_easy()

region_button_tmp = menu_issledovatelckiy_centr_loc
button_press_tmp = "nachalniy.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()


break_repeat = 1
while up_loc:existsClick("up.png") do
	--toast("est")
	
	button_press_tmp = "autoobnovlenie.png"
	Press_button_one_easy()
	
	setManualTouchParameter(3, 5)
	manualTouch(move)
	wait(2)

	button_press_tmp = "yes.png"
	Press_button_one_easy()
	
	wait(2)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

	setManualTouchParameter(3, 5)
	manualTouch(move2)
	wait(2)

break_repeat = 1
while up_loc:existsClick("up.png") do
	button_press_tmp = "autoobnovlenie.png"
	Press_button_one_easy()
	
	setManualTouchParameter(3, 5)
	manualTouch(move)
	wait(2)

	button_press_tmp = "yes.png"
	Press_button_one_easy()
	
	wait(2)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end


region_button_tmp = menu_issledovatelckiy_centr_loc
button_press_tmp = "prodvinytiy.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_one()



break_repeat = 1
while up_loc:existsClick("up.png") do
	button_press_tmp = "autoobnovlenie.png"
	Press_button_one_easy()
	
	setManualTouchParameter(3, 3)
	manualTouch(move)
	wait(2)

	button_press_tmp = "yes.png"
	Press_button_one_easy()
	
	wait(2)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end


setManualTouchParameter(3, 5)
	manualTouch(move2)
	wait(2)

break_repeat = 1
while up_loc:existsClick("up.png") do
	
	button_press_tmp = "autoobnovlenie.png"
	Press_button_one_easy()
	
	setManualTouchParameter(3, 5)
	manualTouch(move)
	wait(2)

	button_press_tmp = "yes.png"
	Press_button_one_easy()
	
	wait(2)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end




Exit()






end

--Слот машина
function Slot_machina()

local laba_loc = Region(1016, 0, 84, 58)
local slot = Region(202, 542, 923, 98)

toast("'Слот машина' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end



region_button_tmp = laba_loc
button_press_tmp = "laba.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()


button_press_tmp = "slot_mashine.png"
Press_button_one_easy()

if dexter_money < 1 then
	dexter_money = 1
end

break_repeat = 1
while not exists("galakticheskaya_slot_mashina_2.png") do
	wait(1)
	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
end

for i = 1, dexter_money do

wait(2)



local karma = find("galakticheskaya_slot_mashina_2.png")
local hod = karma:getX()

r, g, b = getColor(Location(karma:getX() - 10, karma:getY() + 38))
if r < 80 then
	toast("x2")
	zx = 2
elseif g < 80 then
	toast("x8")
	zx = 8
else
	toast("x4")
	zx = 4
end
--s7 = 950 - ((hod - 355) * 0.455)
s7 = 950 - math.abs(((hod - 350) * 0.449))
--if hod < 450 then
--	s7 = 950 - ((hod - 350) * 0.41)
--end

if zx == 4 then
	s7 = s7 * 1.5
end

if zx == 8 then
	s7 = s7 * 2.8
end
s8 = hod / s7

longClick(Location(1040, 390), s8);
stopLongClick()


button_press_tmp = "sm_utverdit.png"
Press_button_one_easy()

wait(1)

press_location_tmp = Location(580, 380)
Press_button_location()


end

if last_crash_game == 0 then
	x = x + 1
	cbValue160 = false
end

Exit()

end

--Берет приз, если он появился
function Priz()
--wait(3)
if t_priz:check() < t_priz_max and t_priz_first == 0 then
	return
end

local priz_location = Region(10, 439, 157, 183)

if priz_location:exists("Priz_free.png") then
	
	region_button_tmp = priz_location
	button_press_tmp = "Priz_free.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	
	wait(5)
end

t_priz:set()
t_priz_first = 0

end

--Проверяет если выбран Небесный портал и/или Цитадель, то фармит, пока бот работает
function Farm_main()

local sbor_main_loc = Region(5, 129, 222, 310)

----toast("Время фарма: "..t_farm_main:check().."\nВремя Панды: "..t_pand:check().."\nВремя НП: "..t_np:check().."\nВремя Арены: "..t_arena:check().."\nХоды:"..t_arena_hody.."\nПервый раз "..t_arena_first.."\nПодарок: "..a_podarok)


if cbValue40 then
	if (t_arena:check() < t_arena_max and t_arena_first == 1) or (t_arena_hody > 0 and t_arena:check() > t_arena_max) then
		Arena()
	end
end

if cbValue10 then
	sbor_main_loc = Region(5, 129, 222, 310)
	if sbor_main_loc:exists("Sbor_aktiven.png") then
		Citadel()
	end
end

if t_farm_main:check() < t_farm_main_max and t_farm_main_first == 0 then
	return
end




if (cbValue26 == false) and (cbValue60 == false) and (cbValue170 == false) and (cbValue180 == false) then
	return
end

----toast("Думаем...")



if (cbValue26) then
	if (sbor_main_loc:exists("perestroenie_broni_main.png")) then
		--sbor_main_loc:getLastMatch():highlight(5)
		Perestroenie_broni()
	end
end

if (cbValue60) then
	if (t_np:check() > t_np_max) or ((t_np:check() < t_np_max) and (t_np_first == 1)) then
		if (sbor_main_loc:exists(Pattern("Besplatnaya_verbovka.png"):similar(0.8))) then
--			sbor_main_loc:getLastMatch():highlight(5)
			Nebesniy_portal()
		end
	end
end

if (cbValue170) then
	if sbor_main_loc:exists(Pattern("oborudovanie_gotovo.png"):similar(0.8)) then
		
		Oborudovanie_upgrade()
	end
end

if (cbValue180) then
	if sbor_main_loc:exists("dostupno_teh_uluchshenie.png") then
		
		Teh_uluchshenie()
	end
end

if (cbValue200) then
	
	pand_d = os.date("%w")
	pand_d = 0 + pand_d
	pand_h = os.date("%H")
	pand_h = 0 + pand_h

	if pand_d == 0 or ((pand_d == 6) and (pand_h > 5)) or (pand_d == 1) or ((pand_d == 2) and (pand_h < 5)) then
		Pandora()
	end

end

t_farm_main:set()
t_farm_main_first = 0

end

--Выход до главного экрана
function Exit()

last_crash_game = 0

local exit_loc = Region(966, 0, 314, 302)

break_repeat = 1
while exit_loc:exists("exit1.png") do
	region_button_tmp = exit_loc
	button_press_tmp = "exit1.png"
	--pause_press_button = 5
	--pause_close_button = 5

	Press_button_two()

	Break_repeat()
	if stop_break_repeat == 1 then
		break
	end
		
end


end

--Пропустить бой
function Propustit()
local propustit_loc = Region(52, 662, 124, 58)
if cbValue2 then
			propustit_loc:existsClick("propustit.png", 5)
		end
		if not (propustit_loc:waitVanish("propustit.png", 3)) then
			propustit_loc:existsClick("propustit.png", 3)
		end
		----toast("propustit")
		wait(1)
end

--Нажимаем далее
function Dalee()

local dalee_main_loc = Region(650, 535, 291, 185)

region_button_tmp = dalee_main_loc
button_press_tmp = "Dalee.png"
--pause_press_button = 5
--pause_close_button = 5

Press_button_two()

end

--делает развитие и улучшения оборудования у выбранного командира
function Oborudovanie_razvitie_i_uluchshenie()
local oborudovanie_razvitie = Location(725, 520)
local oborudovanie_uluchshit = Location(475, 520)
local oborudovanie_inter = Location(970, 520)
local oborudovanie_razvitie_loc = Region(545, 508, 193, 55)
oborudovanie_inter_loc = Region(793, 508, 193, 55)
oborudovanie_multiinter_loc = Region(449, 514, 169, 57)
galka_multi_loc = Region(631, 435, 50, 38)
uroven_inter_loc = Region(639, 283, 51, 19)
bozon_loc = Region(530, 153, 86, 17)
buttle_bozon_loc = Region(474, 305, 398, 255)
uroven_bozon_loc = Region(574, 276, 116, 34)

--oborudovanie_neobhodimuy_loc = Region(444, 323, 398, 57)
oborudovanie_razvitie2_loc = Region(605, 497, 220, 68)
oborudovanie_uluchshit_loc = Region(296, 508, 193, 55)
on = 1
local autoobnovlenie_target_left = Location(535, 495)
local autoobnovlenie_target_right = Location(780, 495)
local move = {
{ action = "touchDown", target = autoobnovlenie_target_left },
{ action = "wait", target = 1 },
{ action = "touchMove", target = autoobnovlenie_target_right },
{ action = "touchUp", target = autoobnovlenie_target_right },
}


local autoobnovlenie_inter_left = Location(526, 451)
local autoobnovlenie_inter_right = Location(780, 451)
local move3 = {
{ action = "touchDown", target = autoobnovlenie_inter_left },
{ action = "wait", target = 1 },
{ action = "touchMove", target = autoobnovlenie_inter_right },
{ action = "touchUp", target = autoobnovlenie_inter_right },
}



local exit_3_loc = Region(983, 117, 75, 63)




--oborudovanie_razvitie_loc:highlight(2)
	if oborudovanie_razvitie_loc:exists("oborudovanie_razvitie.png", 10) then
		break_repeat = 1
		while on == 1 do
			r, g, b = getColor(oborudovanie_razvitie)
			if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
				press_location_tmp = oborudovanie_razvitie
				Press_button_location()


				region_button_tmp = oborudovanie_razvitie2_loc
				button_press_tmp = "oborudovanie_razvitie2.png"
				--pause_press_button = 5
				--pause_close_button = 5

				Press_button_one()

				--oborudovanie_razvitie2_loc:highlight(2)

				press_location_tmp = Location(635, 80)
				Press_button_location()


				
				wait(2)
			else
				on = 0
			end
		
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		
		end
	end
	
	if oborudovanie_uluchshit_loc:exists("oborudovanie_uluchshit.png", 10) then
		r, g, b = getColor(oborudovanie_uluchshit)
		if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
			
			press_location_tmp = oborudovanie_uluchshit
			Press_button_location()

			
			
			
			button_press_tmp = "oborudovanie_autouluchshenie.png"
			Press_button_one_easy()
			
			setManualTouchParameter(3, 5)
			manualTouch(move)
			--wait(2)
			
			button_press_tmp = "yes.png"
			Press_button_one_easy()
			
			--wait(2)
			--click(Location(635, 80))
			--wait(1)
			--click(Location(635, 80))
		end
	end
	
	if oborudovanie_inter_loc:exists("oborudovanie_inter.png", 10) then
		r, g, b = getColor(oborudovanie_inter)
		if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
			button_press_tmp = "oborudovanie_inter.png"
			Press_button_one_easy()

			if not galka_multi_loc:exists(Pattern("galka_multi.png"):similar(0.9)) then
				press_location_tmp = Location(631, 435)
				Press_button_location()


			end
			press_location_tmp = Location(530, 455)
			Press_button_location()


			bottle_bozon_all = regionFindAllNoFindException(buttle_bozon_loc, "bottle_bozon.png")
			bottle_bozon = table.getn(bottle_bozon_all)
			----toast(bottle_bozon)
			if bottle_bozon > 0 then
				r, g, b = getColor(Location(519, 366))
				if b < 230 and bottle_bozon > 1 then
					r, g, b = getColor(Location(663, 366))
					if b < 230 and bottle_bozon > 2 then
						r, g, b = getColor(Location(808, 366))
						if b < 230 and bottle_bozon == 3 then
							press_location_tmp = Location(519, 366)
							Press_button_location()

						else
							toast("Берем бутыль")
							press_location_tmp = Location(808, 366)
							Press_button_location()


						end	
					else
						toast("Берем бутыль")
						press_location_tmp = Location(663, 366)
						Press_button_location()


					end
				else
					toast("Берем бутыль")
					press_location_tmp = Location(519, 366)
					Press_button_location()


				end
				wait(1)
			end
			
			region_button_tmp = oborudovanie_multiinter_loc
			button_press_tmp = "multiinter.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_two()

			
			setManualTouchParameter(3, 5)
			manualTouch(move3)
				
			button_press_tmp = "yes.png"
			Press_button_one_easy()
			
			break_repeat = 1
			while not oborudovanie_multiinter_loc:waitVanish("multiinter.png", 3) do
				press_location_tmp = Location(640, 46)
				Press_button_location()
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
			end
		end
		
		
		
		r, g, b = getColor(oborudovanie_inter)
		
		if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
			
			button_press_tmp = "oborudovanie_inter.png"
			Press_button_one_easy()

			if not galka_multi_loc:exists(Pattern("galka_multi.png"):similar(0.9)) then
				press_location_tmp = Location(631, 435)
				Press_button_location()


			end
			press_location_tmp = Location(530, 455)
			Press_button_location()


			bottle_bozon_all = regionFindAllNoFindException(buttle_bozon_loc, "bottle_bozon.png")
			bottle_bozon = table.getn(bottle_bozon_all)
			----toast(bottle_bozon)
			if bottle_bozon > 0 then
				r, g, b = getColor(Location(519, 366))
				if b < 230 and bottle_bozon > 1 then
					r, g, b = getColor(Location(663, 366))
					if b < 230 and bottle_bozon > 2 then
						r, g, b = getColor(Location(808, 366))
						if b < 230 and bottle_bozon == 3 then
							
							press_location_tmp = Location(519, 366)
							Press_button_location()

						else
							toast("Берем бутыль")
							press_location_tmp = Location(808, 366)
							Press_button_location()


											
						end	
					else
						toast("Берем бутыль")

						press_location_tmp = Location(663, 366)
						Press_button_location()


					end
				else
					toast("Берем бутыль")
					
					press_location_tmp = Location(519, 366)
					Press_button_location()


				end
				wait(1)
			end
			region_button_tmp = oborudovanie_multiinter_loc
			button_press_tmp = "multiinter.png"
			--pause_press_button = 5
			--pause_close_button = 5

			Press_button_one()

			
			setManualTouchParameter(3, 5)
			manualTouch(move3)
				
				
			button_press_tmp = "yes.png"
			Press_button_one_easy()
			
			break_repeat = 1
			while not oborudovanie_inter_loc:exists("oborudovanie_inter.png") do
				press_location_tmp = Location(640, 46)
				Press_button_location()
				Break_repeat()
				if stop_break_repeat == 1 then
					break
				end
			end
	
		end
		
	end


	
	break_repeat = 1
	while exit_3_loc:existsClick("exit1.png") do
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end

end

--делает проверку оборудования по выбранному командиру
function Upgrade_oborudovaniya()
local oborudovanie_on_1 = Location(460, 620)
local oborudovanie_on_2 = Location(567, 620)
local oborudovanie_on_3 = Location(675, 620)
local oborudovanie_on_4 = Location(780, 620)
local oborudovanie_on_5 = Location(888, 620)
oborudovanie_razvitie = Location(725, 520)
local oborudovanie_uluchshit = Location(475, 520)
local oborudovanie_razvitie_loc = Region(545, 508, 193, 55)
--oborudovanie_neobhodimuy_loc = Region(444, 323, 398, 57)
oborudovanie_razvitie2_loc = Region(605, 497, 220, 68)
--oborudovanie_uluchshit_loc = Region(296, 508, 193, 55)

local autoobnovlenie_target_left = Location(535, 495)
local autoobnovlenie_target_right = Location(780, 495)
local move = {
{ action = "touchDown", target = autoobnovlenie_target_left },
{ action = "wait", target = 1 },
{ action = "touchMove", target = autoobnovlenie_target_right },
{ action = "touchUp", target = autoobnovlenie_target_right },
}



local exit_3_loc = Region(983, 117, 75, 63)



r, g, b = getColor(oborudovanie_on_1)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	
	press_location_tmp = oborudovanie_on_1
	Press_button_location()

	Oborudovanie_razvitie_i_uluchshenie()	
	
end
	
r, g, b = getColor(oborudovanie_on_2)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	
	press_location_tmp = oborudovanie_on_2
	Press_button_location()
	
	Oborudovanie_razvitie_i_uluchshenie()

end

r, g, b = getColor(oborudovanie_on_3)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	
	press_location_tmp = oborudovanie_on_3
	Press_button_location()
	
	Oborudovanie_razvitie_i_uluchshenie()
	
end

r, g, b = getColor(oborudovanie_on_4)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	
	press_location_tmp = oborudovanie_on_4
	Press_button_location()
	
	Oborudovanie_razvitie_i_uluchshenie()
	
end

r, g, b = getColor(oborudovanie_on_5)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	
	press_location_tmp = oborudovanie_on_5
	Press_button_location()
	
	Oborudovanie_razvitie_i_uluchshenie()
	
end


end

--Проверяет оборудование по командирам
function Oborudovanie_upgrade()
flot1_loc = Location(83, 109)
flot2_loc = Location(83, 227)
flot3_loc = Location(83, 345)
flot4_loc = Location(83, 466)
flot5_loc = Location(83, 583)
oborudovanie_on_loc = Region(1128, 63, 132, 120)
flot_main_loc = Region(733, 643, 62, 74)
oborudovanie_smena_korabley_loc = Region(569, 534, 141, 46)

r, g, b = getColor(Location(795, 650))

----toast("r:"..r.."g:"..g.."b:"..b)
if (r > 210 and r < 225) and (g > 60 and g < 80) and (b > 30 and b < 50) then
	if not flot_main_loc:existsClick("Flot_main.png") then
		Exit()
		return
	end
	
	flot_main_loc:waitVanish("Flot_main.png")
	break_repeat = 1
	while not oborudovanie_smena_korabley_loc:exists("oborudovanie_smena_korabley.png") do
		wait(1)
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end


	--click(flot1_loc)
	if oborudovanie_on_loc:exists("oborudovanie_on.png") then
		wait(1)
		Upgrade_oborudovaniya()
	end
	
	press_location_tmp = flot2_loc
	Press_button_location()

	
	
	if oborudovanie_on_loc:exists("oborudovanie_on.png") then
		wait(1)
		Upgrade_oborudovaniya()
	end
	
	press_location_tmp = flot3_loc
	Press_button_location()


	
	if oborudovanie_on_loc:exists("oborudovanie_on.png") then
		wait(1)
		Upgrade_oborudovaniya()
	end
	
	press_location_tmp = flot4_loc
	Press_button_location()


	if oborudovanie_on_loc:exists("oborudovanie_on.png") then
		wait(1)
		Upgrade_oborudovaniya()
	end
	
	press_location_tmp = flot5_loc
	Press_button_location()


	if oborudovanie_on_loc:exists("oborudovanie_on.png") then
		wait(1)
		Upgrade_oborudovaniya()
	end


	
end

Exit()

end

--Военная академия
function Voen_akadem()

check_quests_stat_yes = 190
Check_quests_stat()
if check_quests_stat_no == 0 then
else
	--x = x + 1
	return
end

local voen_akadem_nabeg_loc = Region(928, 64, 123, 83)
local voen_akadem_nabeg2_loc = Region(585, 646, 116, 37)
local voen_akadem_spisok_loc = Region(147, 162, 227, 114)
local exit4_loc = Region(1088, 11, 92, 64)

toast("'Военная академия' ("..(x + 1).." из "..z..") заданий")

if not exists("Nebesniy_Portal.png") then					--citadel.png
	return
end

button_press_tmp = "voen_akadem.png"
Press_button_one_easy()

if not waitVanish("voen_akadem.png") then
	return
end

if voen_akadem_nabeg_loc:existsClick("voen_akadem_nabeg.png") then
	if voen_akadem_nabeg2_loc:exists("voen_akadem_nabeg2.png") then
		
		region_button_tmp = voen_akadem_nabeg2_loc
		button_press_tmp = "voen_akadem_nabeg2.png"
		Press_button_one()
		
		break_repeat = 1
		t_break_repeat = 60
		while not exists(Pattern("voen_akadem_spisok.png"):similar(0.99), 3) do

			wait(1)
			
			region_button_tmp = voen_akadem_nabeg2_loc
			button_press_tmp = "voen_akadem_nabeg2.png"
			Press_button_one()
		
			Break_repeat()
			if stop_break_repeat == 1 then
				break
			end
		end

		region_button_tmp = exit4_loc
		button_press_tmp = "exit1.png"
		--pause_press_button = 5
		--pause_close_button = 5
		
		Press_button_one()

	end
end

if last_crash_game == 0 then
	x = x + 1
	cbValue190 = false
	check_quests_stat_no = 1
	Save_new_quests_stat()
end


Exit()

end






--Если что-то не работает (у тапков)
function Crash_game()

for i = 1, 10 do
toast("Перезагрузка через "..(10-i).."...")
wait(1)
end

killApp("com.tap4fun.galaxyempire2_android")
wait(5)

toast("Запускаем Galaxy Legend")
startApp("com.tap4fun.galaxyempire2_android")

local wait_game = 1
while not exists("Nebesniy_Portal.png", 5) do                    --citadel.png
	existsClick("Nachat.png")
	existsClick("mene_ponyato.png")
	existsClick("exit1.png")
	wait(3)
	wait_game = wait_game + 1
	if wait_game == 20 then
		setStopMessage("Не могу зайти в игру :(")
		scriptExit(":(")
	end
end
crash_game = crash_game + 1
last_crash_game = 1
pba = 0
toast("Продолжаем...")

end




--Сбрасывает выполненные задания
function Clear_quests_stat()

file = io.open(scriptPath().."data.log", "w")

io.output(file)

io.write("40 0\n")
io.write("110 0\n")
io.write("150 0\n")
io.write("20 0\n")
io.write("25 0\n")
io.write("70 0\n")
io.write("80 0\n")
io.write("130 0\n")
io.write("140 0\n")
io.write("190 0\n")

io.flush()

io.close(file)

end

--Проверяем выполненные задания
function Check_quests_stat()

complete_quests = 0

quest_s = {}
status_quest = {}
f = io.input (scriptPath().."data.log", "r")


i = 1
repeat
quest, status = f:read ("*n", "*n", "*l")

quest_s[i] = quest
status_quest[i] = status
if quest ~= nil then
	complete_quests = complete_quests + status_quest[i]
end


i = i + 1
until not quest

f:close()

i = 1
repeat
if quest_s[i] == check_quests_stat_yes then
	if status_quest[i] ~= 0 then
		check_quests_stat_no = 1
	else
		check_quests_stat_no = 0
	end
end
i = i + 1
until not status_quest[i]


end

--Подсчет выполненных заданий
function Check_quests_stat_z()

i = 1
repeat
if quest_s[i] == check_quests_stat_yes then
	if status_quest[i] == 0 then
		z = z + 1		
	end
end
i = i + 1
until not status_quest[i]


end

--Сохраняет новый статус задания
function Save_new_quests_stat()

file = io.open(scriptPath().."data.log", "w")

io.output(file)

i = 1
repeat
if quest_s[i] == check_quests_stat_yes then
	status_quest[i] = check_quests_stat_no
end
io.write(quest_s[i].." "..status_quest[i].."\n")

i = i + 1
until not quest_s[i]

io.flush()

io.close(file)

end




--Нажимает на локацию
function Press_button_location()

if last_crash_game == 1 then
	return
end

press_location = press_location_tmp

longClick(press_location, long_click_time)
stopLongClick()

long_click_time = 0.5

end

--Нажимает на кнопку один раз с областью
function Press_button_one()
--toast("жмем один раз")
if last_crash_game == 1 then
	return
end

region_button = region_button_tmp
button_press = button_press_tmp
--pause_press_button = 5
--pause_close_button = 5
if region_button:existsClick(button_press, pause_press_button) then
	toast("Жмем "..button_press)
	return
end
if region_button:existsClick(button_press, (pause_press_button * 2)) then
	region_button:waitVanish(button_press, pause_close_button)
	return
else
	pba = pba + 1
end



end

--Нажимает на кнопку один раз без области
function Press_button_one_easy()

if last_crash_game == 1 then
	return
end


button_press = button_press_tmp
--pause_press_button = 5
--pause_close_button = 5
if exists(button_press) then
	
	existsClick(button_press, pause_press_button)
	--toast("жмем")
else
	pba = pba + 1
end


end

--Нажимает кнопку и ждет пока она пропадет
--[[function Press_button_two() --old

if last_crash_game == 1 then
	return
end

t_press_button_two = Timer()

region_button = region_button_tmp
button_press = button_press_tmp
--pause_press_button = 5
--pause_close_button = 5


time_tmp = 5
time_wait = Timer()

--if region_button:exists(button_press, pause_press_button) then

	--sdd = getLastMatch()
	--sdd:highlight(5)


--region_button:highlight(2)
	local wppb = 0
	while not region_button:existsClick(button_press, pause_press_button) do
		--wait(1)
		region_button:highlight(0.5)
		wppb = wppb + 1
		if time_wait:check() > time_tmp then
			--toast("Невижу кнопки "..wppb)
			time_tmp = time_tmp * 2
			pba = pba + 1
			if wppb > 2 then
				if pba > 3 then
					Crash_game()
				end
				break
			end
		end
		----toast("Нежмется "..wppb)
	end
	
	time_tmp = 5
	time_wait:set()
	
	--image_button_tmp = getLastMatch()
	--region_button = Region(image_button_tmp:getX(), image_button_tmp:getY(), image_button_tmp:getW(), image_button_tmp:getH())
	--region_button:highlight(2)
	local wpcb = 0
	while not region_button:waitVanish(button_press, pause_close_button) do
		--wait(1)
		region_button:highlight(0.5)
		--toast(time_wait:check())
		wpcb = wpcb + 1
		if time_wait:check() > time_tmp then
			
			
				--toast("Неуходит кнопка "..wpcb)
				time_tmp = time_tmp * 2
				region_button:existsClick(button_press)
				pba = pba + 1
				if wpcb > 2 then
					if pba > 3 then
						Crash_game()
					end
					break
				end
			
			
		end
		----toast("Непропадает "..wpcb)
	end
	
	if wppb == 0 and wpcb == 0 then
		pba = 0
	end

if t_press_button_two:check() > pause_press_button and t_press_button_two:check() < (pause_press_button * 2) then
	pause_press_button = pause_press_button * 2
elseif t_press_button_two:check() > (pause_press_button * 2) then
	pause_press_button = pause_press_button * 6
elseif t_press_button_two:check() < 5 then
	pause_press_button = 5
end

pause_close_button = pause_press_button


	--toast("Najal	:"..wppb.."  otpustil	:"..wpcb.."  popitka	:"..pba.."  pause	:"..pause_press_button)



end]]

--[[function Press_button_two() --old2
if last_crash_game == 1 then
	return
end
btn1 = 0
btn2 = 0

t_press_button_two = Timer()
region_button = region_button_tmp
button_press = button_press_tmp
region_button:highlight(0.2)
if not region_button:exists(button_press, pause_press_button) then
	if next_button == 1 then
		next_button = 0
		return
	else
		toast("Нет кнопки".."\n"..button_press.."     "..next_button)
		if not region_button:exists(button_press, (pause_press_button * 3)) then
			toast("Нет кнопки вторая попытка".."\n"..button_press.."     "..next_button)
			Crash_game()
			return
		end
	end
else
	if region_button:existsClick(button_press, pause_press_button) then
		toast("Нажал кнопку".."\n"..button_press.."     "..next_button)
		btn1 = 1
		if not region_button:waitVanish(button_press, pause_close_button) then
			toast("Не уходит кнопка, нажмем еще раз".."\n"..button_press.."     "..next_button)
			local i = 0
			while region_button:existsClick(button_press, pause_press_button) do
				region_button:waitVanish(button_press, pause_close_button)
				i = i + 1
				if i > 1 then
					break
				end
			end
			if not region_button:waitVanish(button_press, (pause_close_button * 3)) then
				toast("Не уходит кнопка, со второй попытки".."\n"..button_press.."     "..next_button)
				Crash_game()
				return
			else
				toast("Ушла со второй попытки".."\n"..button_press.."     "..next_button)
				btn2 = 2
			end
		else
			toast("Ушла кнопка".."\n"..button_press.."     "..next_button)
			btn2 = 1
		end
	else
		region_button:existsClick(button_press, (pause_press_button * 3))
		toast("Еще раз нажимаем".."\n"..button_press.."     "..next_button)
		btn1 = 2
	end
end

pause_press_button = math.ceil((pause_press_button + math.ceil(t_press_button_two:check())) / 2)
pause_close_button = math.ceil((pause_close_button + math.ceil(t_press_button_two:check())) / 2.5)
if t_press_button_two:check() < 5 then
	pause_press_button = 5
	pause_close_button = 5
elseif t_press_button_two:check() > 30 then
	pause_press_button = 30
	pause_close_button = 10
end
next_button = 0
--toast("Najal		:"..btn1.."\notpustil	:"..btn2.."\npause_press_button :"..pause_press_button.." \npause_close_button :"..pause_close_button.."\ntime	:"..t_press_button_two:check())

end]]

function Press_button_two()

if last_crash_game == 1 then
	return
end
btnDOWN = 0
btnUP = 0

t_press_button_two = Timer()
region_button = region_button_tmp
button_press = button_press_tmp
--region_button:highlight(0.2)


local i = 0
while not region_button:exists(button_press) do
	if i > 2 and next_button == 1 then
		toast("Кнопки может и не быть")
		break
	end
	if i > 20 and next_button == 0 then
		toast("Кнопка не появилась")
		Crash_game()
		break
	end
	i = i + 1
end


local i = 0
while region_button:exists(button_press) and last_crash_game == 0 do
	if i > 20 and next_button == 1 then
		toast("Кнопка не уходит")
		Crash_game()
		break
	end
	if region_button:existsClick(button_press, pause_press_button) and region_button:waitVanish(button_press, pause_close_button) then
		toast("Ушла кнопка "..button_press.."("..i..")".."\nPause press: "..pause_press_button.."\nPause close: "..pause_close_button.."\nTime: "..t_press_button_two:check().."\n"..i)
		break
	end
	i = i + 1
end















pause_press_button = math.ceil((pause_press_button + math.ceil(t_press_button_two:check())) / 2)
pause_close_button = math.ceil((pause_close_button + math.ceil(t_press_button_two:check())) / 2.5)
if t_press_button_two:check() < 5 then
	pause_press_button = 5
	pause_close_button = 5
elseif t_press_button_two:check() > 30 then
	pause_press_button = 30
	pause_close_button = 10
end

next_button = 0



end





--Прерывает любой цикл
function Break_repeat()

--toast("Мы в цикле. ".."X = "..x)

if last_crash_game == 1 then
	stop_break_repeat = 1
	return stop_break_repeat
end

stop_break_repeat = 0

if break_repeat == 1 then
	tmp_time = Timer()
	break_repeat = 0
end

if tmp_time:check() > t_break_repeat then
	stop_break_repeat = 1
	tmp_time:set()
	t_break_repeat = 300
	return stop_break_repeat
end

--t_break_repeat = 300

end







dialogInit()



addTextView("\n\t Как будем фармить:")
newRow()
addRadioGroup("rgIndex", 1)
addRadioButton("Фармим все", 10)
addRadioButton("Фармим только кредиты", 20)
addRadioButton("Проходим все, кроме боев", 30)
addRadioButton("Проходим только бои", 31)
addRadioButton("Другое...", 40)
newRow()
addSeparator()

addTextView("\n\t Настройки:")
newRow()
addCheckBox("cbValue3", "Рандомно выполнять задания", false)
newRow()
addCheckBox("cbValue2", "Пропускать битвы", false)
newRow()
addCheckBox("cbValue0", "Показывать статистику", true)
newRow()
addCheckBox("cbValue4", "Сбросить ранее выполненные", true)

addSeparator()

addTextView("\n\t Дополнительно:")
newRow()
addCheckBox("cbValue26", "Перестроение брони", true)
newRow()
addCheckBox("cbValue10", "Цитадель", true)
newRow()
addCheckBox("cbValue170", "Автоулучшение оборудования", false)
newRow()
addCheckBox("cbValue180", "Автоулучшение тех.уровня", false)
newRow()
addCheckBox("cbValue60", "Небесный портал", true)
newRow()
addCheckBox("cbValue200", "Пандора (beta)!!", true)
newRow()
addCheckBox("cbValue1", "Запуск в ", false)



--addTextView("Настраиваем отложенный запуск")
--newRow()
spinnerItemsH = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"}
addTextView("час:  ")
addSpinner("spValueH", spinnerItemsH, os.date("%H"))

spinnerItemsM = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"}
addTextView(" мин:  ")
addSpinnerIndex("spValueM", spinnerItemsM, os.date("%M"))

newRow()



spinnerItemsP = {"Остановиться", "Цикл 10 мин", "Цикл 30 мин", "Цикл 1 час"}
addTextView("\t По окончании: ")
addSpinner("finish", spinnerItemsP, "Остановиться")

newRow()
spinnerItemsP = {"1", "2", "3", "4"}
addTextView("\t Количество игроков: ")
addSpinner("players", spinnerItemsP, "1")


	--addEditNumber("players", 4)
	
	

	
	





	
dialogShow("Bot Galaxy Legend "..latestVersion)


if cbValue3 then
	random_quests = 0
else
	random_quests = 1
end

if cbValue4 then
	Clear_quests_stat()
end

----toast(os.date("%D"))

if rgIndex == 40 then
	dialogInit()
	newRow()
	addTextView("\n\t Выбираем задания в ручную:")
	newRow()
	addTextView("\n\t Бои:")
	newRow()
	addCheckBox("cbValue40", "Арена", true)
	newRow()
	addCheckBox("cbValue50", "Турнир галактики", true)
	newRow()
	addCheckBox("cbValue110", "Бесконечный космос", true)
	newRow()
	addCheckBox("cbValue150", "Хаотичный космос", true)
	newRow()
	addTextView("\n\t Остальное:")
	newRow()
	addCheckBox("cbValue20", "Хозяйственная часть", true)
	newRow()
	addCheckBox("cbValue25", "Альянс          ", true)
	spValueAlyansKredits = {"0 кредитов", "5 кредитов", "50 кредитов"}
	addTextView("Сколько жертвуем в альянс:  ")
	addSpinner("dop_bonus", spValueAlyansKredits, 0)
	addCheckBox("cbValue26", "Перестроение брони", true)
	newRow()
	addCheckBox("cbValue70", "Карта на месяц", true)
	newRow()
	addCheckBox("cbValue80", "Ежедневный пакет", true)
	newRow()
	addCheckBox("cbValue90", "Бонусы", true)
	newRow()
	addCheckBox("cbValue100", "Мои награды", true)
	newRow()
	addCheckBox("cbValue120", "Акции", true)
	newRow()
	addCheckBox("cbValue130", "Боевая подготовка", true)
	newRow()
	addCheckBox("cbValue140", "События", true)
	newRow()
	addCheckBox("cbValue160", "Слот машина            ", true)
	addTextView("Сколько тратим монет:  ")
	addEditNumber("dexter_money", 1)
	newRow()
	addCheckBox("cbValue190", "Военная академия", true)
	newRow()
	addCheckBox("cbValue30", "Сбор заданий", true)
	addSeparator()
	newRow()
	addTextView("\n\t Настройки:")
	newRow()
	addCheckBox("cbValue3", "Рандомно выполнять задания", false)
	newRow()
	addCheckBox("cbValue2", "Пропускать битвы", false)
	newRow()
	addCheckBox("cbValue0", "Показывать статистику", true)
	newRow()
	addCheckBox("cbValue4", "Сбросить ранее выполненные", true)
	
	addSeparator()
	newRow()
	addTextView("\n\t Дополнительно:")
	newRow()
	addCheckBox("cbValue10", "Цитадель", true)
	newRow()
	addCheckBox("cbValue170", "Автоулучшение оборудования", false)
	newRow()
	addCheckBox("cbValue180", "Автоулучшение тех.уровня", false)
	newRow()
	addCheckBox("cbValue60", "Небесный портал", true)
	newRow()
	addCheckBox("cbValue200", "Пандора (beta)!!", true)
	newRow()
	
	
	addCheckBox("cbValue1", "Запуск в ", false)
	spinnerItemsH = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"}
	addTextView("час:  ")
	addSpinner("spValueH", spinnerItemsH, os.date("%H"))
	spinnerItemsM = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"}
	addTextView(" мин:  ")
	addSpinnerIndex("spValueM", spinnerItemsM, os.date("%M"))

	dialogShowFullScreen("Bot Galaxy Legend 0.6.1")

	cbValue1000 = cbValue0
	cbValue1010 = cbValue10
	cbValue1020 = cbValue20
	cbValue1025 = cbValue25
	cbValue1026 = cbValue26
	cbValue1030 = cbValue30
	cbValue1040 = cbValue40
	cbValue1050 = cbValue50
	cbValue1060 = cbValue60
	cbValue1070 = cbValue70
	cbValue1080 = cbValue80
	cbValue1090 = cbValue90
	cbValue1100 = cbValue100
	cbValue1110 = cbValue110
	cbValue1120 = cbValue120
	cbValue1130 = cbValue130
	cbValue1140 = cbValue140
	cbValue1150 = cbValue150
	cbValue1160 = cbValue160
	cbValue1170 = cbValue170
	cbValue1180 = cbValue180
	cbValue1190 = cbValue190
	cbValue1200 = cbValue200
	
	
end




























if cbValue1 then
	
	if (((os.date("%H") * 60) + os.date("%M")) - (spValueH * 60 + spValueM)) > 0 then
		time_start = (24 * 60) - (((os.date("%H") * 60) + os.date("%M")) - (spValueH * 60 + spValueM))
	else
		time_start = ((spValueH * 60 + spValueM) - ((os.date("%H") * 60) + os.date("%M")))
	end
	
	local H = (time_start - math.fmod(time_start, 60)) / 60
	local M = math.fmod(time_start, 60)
	
	if H == 0 then
		toast("до запуска: "..M.." мин")
	else
		toast("до запуска: "..H.." час "..M.." мин")
	end
	
	wait(60)

end





























--Начало------------------------------------------------------------------------------------------------

players = tonumber(players)
t_farm_main = Timer()
t_pand = Timer()
t_np = Timer()
t_arena = Timer()
t_priz = Timer()

toast("Bot Galaxy Legend "..latestVersion)






if not startApp("com.tap4fun.galaxyempire2_android") then
	setStopMessage("Не могу зайти в игру :(")
	scriptExit(":(")
end

ResolScreen()

Exit()



local wait_game = 1
while not exists("Nebesniy_Portal.png", 5) do					--citadel.png
	existsClick("Nachat.png")
	existsClick("mene_ponyato.png")
	existsClick("exit1.png")
	wait(3)
	wait_game = wait_game + 1
if wait_game == 20 then
	setStopMessage("Не могу зайти в игру :(")
	scriptExit(":(")
end
end









for p = 1, players do



t_players = Timer()
t_players:set()

if rgIndex == 10 then
	--cbValue10 = true
	cbValue20 = true
	cbValue25 = true
	cbValue30 = true
	cbValue40 = true
	cbValue50 = true
	cbValue70 = true
	cbValue80 = true
	cbValue90 = true
	cbValue100 = true
	cbValue110 = true
	cbValue120 = true
	cbValue130 = true
	cbValue140 = true
	cbValue150 = true
	cbValue160 = true
	cbValue190 = true
	--cbValue200 = true
end

if rgIndex == 20 then
	--cbValue10 = false
	cbValue20 = false
	cbValue25 = false
	cbValue30 = false
	cbValue40 = true
	cbValue50 = false
	cbValue70 = true
	cbValue80 = false
	cbValue90 = false
	cbValue100 = false
	cbValue110 = false
	cbValue120 = false
	cbValue130 = false
	cbValue140 = true
	cbValue150 = false
	cbValue160 = false
	cbValue190 = false
end

if rgIndex == 30 then
	--cbValue10 = true
	cbValue20 = true
	cbValue25 = true
	cbValue30 = true
	cbValue40 = false
	cbValue50 = false
	cbValue70 = true
	cbValue80 = true
	cbValue90 = true
	cbValue100 = true
	cbValue110 = false
	cbValue120 = true
	cbValue130 = true
	cbValue140 = true
	cbValue150 = false
	cbValue160 = true
	cbValue190 = true
end

if rgIndex == 31 then
	--cbValue10 = false
	cbValue20 = false
	cbValue25 = false
	cbValue30 = false
	cbValue40 = true
	cbValue50 = true
	cbValue70 = false
	cbValue80 = false
	cbValue90 = false
	cbValue100 = false
	cbValue110 = true
	cbValue120 = false
	cbValue130 = false
	cbValue140 = false
	cbValue150 = true
	cbValue160 = false
	cbValue190 = false
end

if rgIndex == 40 then
	cbValue0 = cbValue1000
	cbValue10 = cbValue1010
	cbValue20 = cbValue1020
	cbValue25 = cbValue1025
	cbValue26 = cbValue1026
	cbValue30 = cbValue1030
	cbValue40 = cbValue1040
	cbValue50 = cbValue1050
	cbValue60 = cbValue1060
	cbValue70 = cbValue1070
	cbValue80 = cbValue1080
	cbValue90 = cbValue1090
	cbValue100 = cbValue1100
	cbValue110 = cbValue1110
	cbValue120 = cbValue1120
	cbValue130 = cbValue1130
	cbValue140 = cbValue1140
	cbValue150 = cbValue1150
	cbValue160 = cbValue1160
	cbValue170 = cbValue1170
	cbValue180 = cbValue1180
	cbValue190 = cbValue1190
	cbValue200 = cbValue1200
end

z = 0

Check_quests_stat()

if (cbValue30) then
	z = z + 1
end
if (cbValue50) then
	z = z + 1
end
if (cbValue90) then
	z = z + 1
end
if (cbValue100) then
	z = z + 1
end
if (cbValue120) then
	z = z + 1
end
if (cbValue160) then
	z = z + 1
end
if (cbValue20) then
	check_quests_stat_yes = 20
	Check_quests_stat_z()
end
if (cbValue25) then
	check_quests_stat_yes = 25
	Check_quests_stat_z()
end
if (cbValue40) then
	check_quests_stat_yes = 40
	Check_quests_stat_z()
end
if (cbValue70) then
	check_quests_stat_yes = 70
	Check_quests_stat_z()
end
if (cbValue80) then
	check_quests_stat_yes = 80
	Check_quests_stat_z()
end
if (cbValue110) then
	check_quests_stat_yes = 110
	Check_quests_stat_z()
end
if (cbValue130) then
	check_quests_stat_yes = 130
	Check_quests_stat_z()
end
if (cbValue140) then
	check_quests_stat_yes = 140
	Check_quests_stat_z()
end
if (cbValue150) then
	check_quests_stat_yes = 150
	Check_quests_stat_z()
end
if (cbValue190) then
	check_quests_stat_yes = 190
	Check_quests_stat_z()
end


Exit()

if (rgIndex == 40) or (rgIndex == 31) or (rgIndex == 30) or (rgIndex == 20) or (rgIndex == 10) then
x = 1

end
if not cbValue4 and rgIndex == 10 then
	Check_quests_stat()
	toast("Сегодня уже выполнено: "..complete_quests.." заданий")
end

if (cbValue0) then
	Resyrsi_start()
end

--Priz()

--Farm_main()
x = x - 1
--toast(x..":"..z)



while x < z do



existsClick("mene_ponyato.png")
existsClick("exit1.png")

Priz()

Farm_main()




i = math.random(random_quests, 1)
if i == 1 then
	if (cbValue20) then
	Hoz_Chast()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
	if (cbValue25) then
	Alyans()
	Priz()
	Farm_main()	
end
end

i = math.random(random_quests, 1)
if i == 1 then
	if cbValue40 == true and t_arena_hody < 1 and a_podarok == 0 then
		--x = x + 1
		cbValue40 = false
		Priz()
		Farm_main()
	end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue50) then
	Turnir_galaktiki()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then	
if (cbValue70) then
	Sbor_everyday_credits()
	Priz()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue80) then
	Poisk_paketa()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue90) then
	Bonus()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue100) then
	Moi_nagrady()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue110) then
	Beskonechniy_kosmos()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue120) then
	Akciya()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue130) then
	Boevaya_podgotovka()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue140) then
	Sobytiya()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue150) then
	Haotichniy_kosmos()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue160) then
	Slot_machina()
	Priz()
	Farm_main()
end
end

i = math.random(random_quests, 1)
if i == 1 then
if (cbValue190) then
	Voen_akadem()
	Priz()
	Farm_main()
end
end

if (cbValue30) and x == (z - 1) then
	Quests()
	Priz()
	Farm_main()
end







end


if (cbValue0) then
	Resyrsi_stop()
end



if finish == "Цикл 10 мин" then
	toast("Цикл 10 мин")
	while true do
		Priz()
		Farm_main()
		if (cbValue200) then
	
			pand_d = os.date("%w")
			pand_d = 0 + pand_d
			pand_h = os.date("%H")
			pand_h = 0 + pand_h

			if pand_d == 0 or ((pand_d == 6) and (pand_h > 5)) or (pand_d == 1) or ((pand_d == 2) and (pand_h < 5)) then
				Pandora()
			end

		end
		wait(600)
		if cbValue50 then
			Turnir_galaktiki()
		end
	end
elseif finish == "Цикл 30 мин" then
	toast("Цикл 30 мин")
	while true do
		Priz()
		Farm_main()
		if (cbValue200) then
	
			pand_d = os.date("%w")
			pand_d = 0 + pand_d
			pand_h = os.date("%H")
			pand_h = 0 + pand_h

			if pand_d == 0 or ((pand_d == 6) and (pand_h > 5)) or (pand_d == 1) or ((pand_d == 2) and (pand_h < 5)) then
				Pandora()
			end

		end
		wait(1800)
		if cbValue50 then
			Turnir_galaktiki()
		end
	end
elseif finish == "Цикл 1 час" then
	toast("Цикл 60 мин")
	while true do
		Priz()
		Farm_main()
		if (cbValue200) then
	
			pand_d = os.date("%w")
			pand_d = 0 + pand_d
			pand_h = os.date("%H")
			pand_h = 0 + pand_h

			if pand_d == 0 or ((pand_d == 6) and (pand_h > 5)) or (pand_d == 1) or ((pand_d == 2) and (pand_h < 5)) then
				Pandora()
			end

		end
		wait(3600)
		if cbValue50 then
			Turnir_galaktiki()
		end
	end
end











print ("Перезагрузка: "..crash_game.." раз")

print (p.." игрок.  "..math.floor(t_players:check()/3600).." час  "..((math.floor((t_players:check() / 60))) - (math.floor(t_players:check()/3600) * 60)).." мин  "..math.floor(t_players:check() - (math.floor(t_players:check()/3600) * 3600) - (((math.floor((t_players:check() / 60))) - (math.floor(t_players:check()/3600) * 60))*60)).." сек".."\n"..t_players:check().."\nБои:\nКор: "..bk_fight_kor.."\nСум: "..bk_fight_suma.."\nЧер: "..bk_fight_che.."\nЭкс: "..bk_fight_exp)
--print (p.." - "..t_players:check())

--toast("Finita")



change_player_loc = Region(488, 528, 607, 158)
nachat_loc = Region(513, 499, 252, 51)


if p == 1 and players > 1 then
	wait(2)
	click(Location(1223, 676))
	break_repeat = 1
	while not exists("nastroyki.png") do
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	break_repeat = 1
	while not change_player_loc:exists("!!player_N.png", 30) do
		click(Location(792, 471))
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	change_player_loc:existsClick("!!player_N.png", 30)
	existsClick("yes.png", 30)
	nachat_loc:existsClick("Nachat.png", 60)
	if not nachat_loc:waitVanish("Nachat.png", 30) then
		nachat_loc:existsClick("Nachat.png", 30)
	end
	Exit()
	local wait_game = 1
	while not exists("Nebesniy_Portal.png", 5) do					--citadel.png
		existsClick("Nachat.png")
		existsClick("mene_ponyato.png")
		existsClick("exit1.png")
		wait(3)
		wait_game = wait_game + 1
	if wait_game == 20 then
		setStopMessage("Не могу зайти в игру :(")
		scriptExit(":(")
	end
	end
	--exists("citadel.png", 15)
	Clear_quests_stat()
	t_arena_first = 1
	t_arena_hody = 5
	a_podarok = 1
	wait(10)
end

if p == 2 and players > 1 then
	wait(2)
	click(Location(1223, 676))
	break_repeat = 1
	while not exists("nastroyki.png") do
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	break_repeat = 1
	while not change_player_loc:exists("!!player_S.png", 30) do
		click(Location(792, 471))
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	change_player_loc:existsClick("!!player_S.png", 30)
	existsClick("yes.png", 30)
	nachat_loc:existsClick("Nachat.png", 60)
	if not nachat_loc:waitVanish("Nachat.png", 30) then
		nachat_loc:existsClick("Nachat.png", 30)
	end
	Exit()
	local wait_game = 1
	while not exists("Nebesniy_Portal.png", 5) do					--citadel.png
		existsClick("Nachat.png")
		existsClick("mene_ponyato.png")
		existsClick("exit1.png")
		wait(3)
		wait_game = wait_game + 1
	if wait_game == 20 then
		setStopMessage("Не могу зайти в игру :(")
		scriptExit(":(")
	end
	end
	--exists("citadel.png", 15)
	Clear_quests_stat()
	t_arena_first = 1
	t_arena_hody = 5
	a_podarok = 1
	wait(10)
end

if p == 3 and players > 1 then
	wait(2)
	click(Location(1223, 676))
	break_repeat = 1
	while not exists("nastroyki.png") do
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	break_repeat = 1
	while not change_player_loc:exists("!!player_P.png", 30) do
		click(Location(792, 471))
		Break_repeat()
		if stop_break_repeat == 1 then
			break
		end
	end
	change_player_loc:existsClick("!!player_P.png", 30)
	existsClick("yes.png", 30)
	nachat_loc:existsClick("Nachat.png", 60)
	if not nachat_loc:waitVanish("Nachat.png", 30) then
		nachat_loc:existsClick("Nachat.png", 30)
	end
	Exit()
	local wait_game = 1
	while not exists("Nebesniy_Portal.png", 5) do					--citadel.png
		existsClick("Nachat.png")
		existsClick("mene_ponyato.png")
		existsClick("exit1.png")
		wait(3)
		wait_game = wait_game + 1
	if wait_game == 20 then
		setStopMessage("Не могу зайти в игру :(")
		scriptExit(":(")
	end
	end
	--exists("citadel.png", 15)
	Clear_quests_stat()
	t_arena_first = 1
	t_arena_hody = 5
	a_podarok = 1
	wait(10)
end







end


if finish == "Остановиться" then
	killApp("com.tap4fun.galaxyempire2_android")
end








