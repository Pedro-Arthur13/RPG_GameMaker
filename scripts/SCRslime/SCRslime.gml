function SCRslimeEscolherEstado(){
	proxEstado = choose(SCRslimeAndando,SCRslimeParado)//decide o proximo estado aleatoriamente

	if proxEstado == SCRslimeAndando{//muda o estado
		estado = SCRslimeAndando
		destX = irandom_range(0,room_width) //O "i" no início significa que vai puxar apenas número
		destY = irandom_range(0,room_height) //define onde ele deve ir no Y
	}
	else if proxEstado == SCRslimeParado{
		estado = SCRslimeParado
	}
	
}
function SCRslimeAndando(){
	image_speed = 1
	var _dir = point_direction(x,y, destX, destY) //variavel local | A direção que ele vai (x,y) do destino
	veloHori = lengthdir_x(veloSlime, _dir) //comprimento e direção do X
	veloVerti = lengthdir_y(veloSlime, _dir) 
	
	x += veloHori
	y += veloVerti
}
function SCRslimeParado(){
	image_speed = 0.5
	
}
