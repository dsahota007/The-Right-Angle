extends Control

var save_path = "user://variable.save"
@onready var player_triangle = $"../.."
 


func resume():
	get_tree().paused = false
	 

func pause():
	get_tree().paused = true
 

func testEsc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
		self.visible = true
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()
		self.visible = false
		


func _on_resume_pressed():
	resume()
	self.visible = false


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()
	self.visible = false


func _on_quit_pressed():
	get_tree().paused = false  #this is so the main menu doesnt stay paused 
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")
	
	

func _process(delta):
	testEsc()


#func _on_save_button_pressed():
	#save()
#
#
#func _on_load_button_pressed():
	#load_data() # Replace with function body.
 
	
#func save():
	#var file = FileAccess.open(save_path, FileAccess.WRITE)
	#file.store_var(player_triangle.position)
	#print(player_triangle.position)
	#print("game saved!")
	#
#func load_data():
	#if FileAccess.file_exists(save_path):
		#var file = FileAccess.open(save_path, FileAccess.READ)
		#player_triangle.position = file.get_var(player_triangle.position)
	#else:
		#print("xzxzxzxasfdbjsdbfsd")
		


func _on_screen_pause_btn_pressed():
	pause()
	self.visible = true


func _ready():
	update_button_text()
	
@onready var button = $PanelContainer/VBoxContainer/Button

func _on_button_pressed():
	GlobalAudio.toggle_volume()  
	update_button_text()

func update_button_text():
	if button:
		if GlobalAudio.is_muted:
			button.text = "Turn Vol on"
		else:
			button.text = "Turn Vol off"
	else:
		print("Button node is not accessible")
