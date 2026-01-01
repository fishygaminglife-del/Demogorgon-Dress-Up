extends Node2D

var counter = 0
var current_order = -1
var life = 3
var num = 4


func _ready() -> void:
	$GreenFlowerText.visible = false
	$BlueFlowerText.visible = false
	$OrangeFlowerText.visible = false
	$Status1.visible = false
	$AnimationPlayer/OrangeFlowerOn.visible = false
	$AnimationPlayer/GreenFlowerOn.visible = false
	$AnimationPlayer/BlueFlowerOn.visible = false
	$TextBox.visible = false
	$Button.disabled = true
	$Button2.disabled = true
	$Button3.disabled = true
	$AnimationPlayer.play("lvl1_intro")
	await $AnimationPlayer.animation_finished
	$Button.disabled = false
	$Button2.disabled = false
	$Button3.disabled = false
	choose_random_order()
	
func game1_logic():
	if counter == 0:
		$Button.disabled = false
		$Button2.disabled = false
		$Button3.disabled = false
	else:
		$Button.disabled = true
		$Button2.disabled = true
		$Button3.disabled = true
		$TextBox.visible = false
		$GreenFlowerText.visible = false
		$BlueFlowerText.visible = false
		$OrangeFlowerText.visible = false
		$Status1.visible = false
		$Lives.text = str(int(life))
		if life == 0:
			$Status1.visible = true
			await get_tree().create_timer(1).timeout
			get_tree().reload_current_scene()
		else:
			$AnimationPlayer.play("lvl1_outro")
			await $AnimationPlayer.animation_finished
			new_demo()
		
func new_demo():
	num -= 1
	$DemoLeft.text = str(int(num))
	if num == 0:
		get_tree().change_scene_to_file("res://scenes/lvl2.tscn")
	else:
		$AnimationPlayer/OrangeFlowerOn.visible = false
		$AnimationPlayer/GreenFlowerOn.visible = false
		$AnimationPlayer/BlueFlowerOn.visible = false
		$AnimationPlayer.play("lvl1_intro")
		await $AnimationPlayer.animation_finished
		$Button.disabled = false
		$Button2.disabled = false
		$Button3.disabled = false
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




func _on_button_pressed() -> void:
	$AnimationPlayer/GreenFlowerOn.visible = true
	if current_order == 0:
		print("happy")
		counter +=1
		game1_logic()
		
	else:
		print("sad")
		counter +=1
		life -=1
		game1_logic()
		
func _on_button_2_pressed() -> void:
	$AnimationPlayer/OrangeFlowerOn.visible = true
	if current_order == 1:
		print("happy")
		counter +=1
		game1_logic()
	else:
		print("sad")
		counter +=1
		life -=1
		game1_logic()
		
func _on_button_3_pressed() -> void:
	$AnimationPlayer/BlueFlowerOn.visible = true
	if current_order == 2:
		print("happy")
		counter +=1
		game1_logic()
	else:
		print("sad")
		counter +=1
		life -=1
		game1_logic()
