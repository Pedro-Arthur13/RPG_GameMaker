function SCRpersonagemAnda(){
	//Movimentação
	direita = keyboard_check(ord("D"))
	esquerda = keyboard_check(ord("A"))
	cima = keyboard_check(ord("W"))
	baixo = keyboard_check(ord("S"))

	veloHori = (direita-esquerda)
	veloVerti = (baixo-cima) // pra cima diminui o y e pra baixo aumenta o y
	
	veloDirecao = point_direction(x,y, x + veloHori, y + veloVerti)
	
	if veloHori != 0 or veloVerti !=0{
		veloPlayer = 2
	}else{
		veloPlayer = 0
	}
	
	veloHori = lengthdir_x(veloPlayer, veloDirecao)
	veloVerti = lengthdir_y(veloPlayer, veloDirecao)//para correr na mesma velocidade quando tiver andando na diagonal
	//colisão
	if place_meeting(x + veloHori,y, oParede){ // colisão
		while !place_meeting(x + sign(veloHori), y, oParede){
			x += sign(veloHori)
		}
		veloHori = 0 // se bater ou encostar em algo velocidade = 0
	}
	x += veloHori

	

	if place_meeting(x, y + veloVerti, oParede){
		while !place_meeting(x, y + sin(veloVerti), oParede){
			y += sign(veloVerti)
		}
		veloVerti = 0
	}
	y += veloVerti

	//Mudar sprite
	direcao = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90)
	if veloHori = 0 and veloVerti = 0
		switch direcao{
			default://tipo ellif
			sprite_index = SplayerD
			break
			case 1:
			sprite_index = SplayerW
			break
			case 2:
			sprite_index = SplayerA
			break
			case 3:
			sprite_index = SplayerS
			break}
		else{
			switch direcao{
				default:
				sprite_index = SplayerDcorre
				break
				case 1:
				sprite_index = SplayerWcorre
				break
				case 2:
				sprite_index = SplayerAcorre
				break
				case 3:
				sprite_index = SplayerScorre
				break
			}
		}
		if estamina >= 10{
			if mouse_check_button_pressed(mb_right){
				estamina -= 10
				alarm[1] = 180
				alarm[0] = 8
				dash_direcao = point_direction(x, y, mouse_x, mouse_y)//qual direção do mouse em relação ao personagem
				state = SCRpersonagemDash
	}  
		
		}
	
}

function SCRpersonagemDash(){
	veloHori = lengthdir_x(velo_dash, dash_direcao)
	veloVerti = lengthdir_y(velo_dash, dash_direcao)
	
	x += veloHori// a cada frame do dash altera o 'x' e o 'y'
	y += veloVerti

	var_inst = instance_create_layer(x, y, "Instances", oDash)// e cria nesse 'x' e nesse 'y' a sprite do personagem
	var_inst.sprite_index = sprite_index
}