extends Node2D

var counter = 0
var current_order = -1
var current_order1 = -1
var current_order2 = -1
var life = 3
var num = 4
var time_left =  40
var timer_running = true


func _ready() -> void:
	$GreenFlowerText.visible = false
	$BlueFlowerText.visible = false
	$OrangeFlowerText.visible = false
	$AnimationPlayer/GreenBowOn.visible = false
	$AnimationPlayer/OrangeBowOn.visible = false
	$AnimationPlayer/BlueBowOn.visible = false
	$Status1.visible = false
	$GreenBowBox.visible = false
	$OrangeBowBox.visible = false
	$BlueBowBox.visible = false
	$GreenFlowerBox.visible = true
	$BlueFlowerBox.visible = true
	$OrangeFlowerBox.visible = true
	$AnimationPlayer/BlackFlowerHead.visible = false
	$AnimationPlayer/SilverFlowerHead.visible = false
	$AnimationPlayer/BlueFlowerOn.visible = false
	$AnimationPlayer/GreenFlowerOn.visible = false
	$AnimationPlayer/OrangeFlowerOn.visible = false
	$TextBox.visible = false
	$Button1.disabled = true
	$Button2.disabled = true
	$Button3.disabled = true
	$"Button1-2".disabled = true
	$"Button2-2".disabled = true
	$"Button3-2".disabled = true
	$Lvl_stat.visible = true
	await get_tree().create_timer(1).timeout
	$Lvl_stat.visible = false
	$AnimationPlayer.play("lvl3_intro")
	await $AnimationPlayer.animation_finished
	$Button1.disabled = false
	$Button2.disabled = false
	$Button3.disabled = false
	choose_random_order()
	
func _process(delta):
	await get_tree().create_timer(1).timeout
	if timer_running:
		time_left -= delta
		if time_left <= 0:
			timer_running = false
			time_left = 0
			time_up()
	$Timer.text = str(int(time_left))

func time_up():
	$Status1.visible = true
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/HomePage.tscn")


func game1_logic():
	$Button1.disabled = true
	$Button2.disabled = true
	$Button3.disabled = true
	$Button1.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$BlueFlowerBox.visible = false
	$OrangeFlowerBox.visible = false
	$GreenFlowerBox.visible = false
	$BlackPetalBox.visible = true
	$RegularFlowerPetalBox.visible = true
	$SilverPetalBox.visible = true
	$"Button1-2".disabled = false
	$"Button2-2".disabled = false
	$"Button3-2".disabled = false
	$"Button1-2".visible = true
	$"Button2-2".visible = true
	$"Button3-2".visible = true
	
func game2_logic():
	$"Button1-2".disabled = true
	$"Button2-2".disabled = true
	$"Button3-2".disabled = true
	$"Button1-2".visible = false
	$"Button2-2".visible = false
	$"Button3-2".visible = false
	$BlackPetalBox.visible = false
	$SilverPetalBox.visible = false
	$RegularFlowerPetalBox.visible = false
	$GreenBowBox.visible = true
	$OrangeBowBox.visible = true
	$BlueBowBox.visible = true
	$"Button1-3".disabled = false
	$"Button2-3".disabled = false
	$"Button3-3".disabled = false
	$"Button1-3".visible = true
	$"Button2-3".visible = true
	$"Button3-3".visible = true


	$Lives.text = str(int(life))
	if life == 0:
		$Status1.visible = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
		pass
		
func new_demo():
	$Lives.text = str(int(life))
	if life == 0:
		$Status1.visible = true
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/HomePage.tscn")

	$"Button1-2".disabled = true
	$"Button2-2".disabled = true
	$"Button3-2".disabled = true
	$"Button1-2".visible = false
	$"Button2-2".visible = false
	$"Button3-2".visible = false
	$TextBox.visible = false
	$GreenFlowerText.visible = false
	$BlueFlowerText.visible = false
	$OrangeFlowerText.visible = false
	$BlackPetalText.visible = false
	$GreenBowText.visible = false
	$OrangeBowText.visible = false
	$BlueBowText.visible = false
	$RegularFlowerPetalText.visible = false
	$SilverPetalText.visible = false
	$AnimationPlayer.play("lvl3_outro")
	await $AnimationPlayer.animation_finished	
	num -= 1
	$DemoLeft.text = str(int(num))
	if num == 0:
		get_tree().change_scene_to_file("res://scenes/Last.tscn")
	else:
		
		$AnimationPlayer/OrangeFlowerOn.visible = false
		$AnimationPlayer/GreenFlowerOn.visible = false
		$AnimationPlayer/BlueFlowerOn.visible = false
		$AnimationPlayer/SilverFlowerHead.visible = false
		$AnimationPlayer/BlackFlowerHead.visible = false
		$AnimationPlayer/GreenBowOn.visible = false
		$AnimationPlayer/OrangeBowOn.visible = false
		$AnimationPlayer/BlueBowOn.visible = false
		$GreenBowBox.visible = false
		$BlueBowBox.visible = false
		$OrangeBowBox.visible = false
		$GreenFlowerBox.visible = true
		$BlueFlowerBox.visible = true
		$OrangeFlowerBox.visible = true
		$AnimationPlayer.play("lvl3_intro")
		await $AnimationPlayer.animation_finished
		$GreenFlowerBox.visible = true
		$BlueFlowerBox.visible = true
		$OrangeFlowerBox.visible = true
		$Button1.disabled = false
		$Button2.disabled = false
		$Button3.disabled = false
		$Button1.visible = true
		$Button2.visible = true
		$Button3.visible = true
	
		choose_random_order()

func choose_random_order():
	current_order = randi()%3
	$GreenFlowerText.visible = false
	$BlueFlowerText.visible = false
	$OrangeFlowerText.visible = false
	$TextBox.visible = false
	match current_order:
		0:
			$GreenFlowerText.visible = true
			$TextBox.visible = true
		1:
			$OrangeFlowerText.visible = true
			$TextBox.visible = true
		2:
			$BlueFlowerText.visible = true
			$TextBox.visible = true
	choose_random_order1()
	
func choose_random_order1():
	current_order1 = randi()%3
	$BlackPetalText.visible = false
	$RegularFlowerPetalText.visible = false
	$SilverPetalText.visible = false
	match current_order1:
		0:
			$BlackPetalText.visible = true
		1:
			$RegularFlowerPetalText.visible = true
		2:
			$SilverPetalText.visible = true
	choose_random_order2()

func choose_random_order2():
	current_order2 = randi()%3
	$GreenBowText.visible = false
	$OrangeBowText.visible = false
	$BlueBowText.visible = false
	match current_order2:
		0:
			$BlueBowText.visible = true
		1:
			$GreenBowText.visible = true
		2:
			$OrangeBowText.visible = true


#set 1 of buttons
func _on_button_1_pressed() -> void:
	$AnimationPlayer/GreenFlowerOn.visible = true
	if current_order == 0:
		$Demo3Happy.play()
		game1_logic()
		
	else:
		life -=1
		$Demo2Mad.play()
		game1_logic()
		
func _on_button_2_pressed() -> void:
	$AnimationPlayer/OrangeFlowerOn.visible = true
	if current_order == 1:
		$Demo3Happy.play()
		game1_logic()
	else:
		life -=1
		$Demo2Mad.play()
		game1_logic()
		
func _on_button_3_pressed() -> void:
	$AnimationPlayer/BlueFlowerOn.visible = true
	if current_order == 2:
		$Demo3Happy.play()
		game1_logic()
	else:
		life -=1
		$Demo1Mad.play()
		game1_logic()

#set 2 of buttons
func _on_button_1_2_pressed() -> void:
	$AnimationPlayer/BlackFlowerHead.visible = true
	if current_order1 == 0:
		$Demo3Happy.play()
		game2_logic()
		
	else:
		life -=1
		$Demo1Mad.play()
		game2_logic()


func _on_button_2_2_pressed() -> void:
	if current_order1 == 1:
		$Demo3Happy.play()
		game2_logic()
	else:
		life -=1
		$Demo2Mad.play()
		game2_logic()
func _on_button_3_2_pressed() -> void:
	$AnimationPlayer/SilverFlowerHead.visible = true
	if current_order1 == 2:
		$Demo3Happy.play()
		game2_logic()
	else:
		life -=1
		$Demo1Mad.play()
		game2_logic()

#set 3 of buttons
func _on_button_1_3_pressed() -> void:
	$AnimationPlayer/BlueBowOn.visible = true
	if current_order2 == 0:
		$Demo3Happy.play()
		new_demo()
	else:
		life -=1
		$Demo1Mad.play()
		new_demo()
	

func _on_button_2_3_pressed() -> void:
	$AnimationPlayer/GreenBowOn.visible = true
	if current_order2 == 1:
		$Demo3Happy.play()
		new_demo()
	else:
		life -=1
		$Demo2Mad.play()
		new_demo()
func _on_button_3_3_pressed() -> void:
	$AnimationPlayer/OrangeBowOn.visible = true
	if current_order2 == 2:
		$Demo3Happy.play()
		new_demo()
	else:
		life -=1
		$Demo2Mad.play()
		new_demo()
