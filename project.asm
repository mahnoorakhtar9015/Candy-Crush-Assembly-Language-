; ---------------------------------------------------------
;|MAHNOOR AKHTAR --- 20I-0635                              |
;|AINA ZAINAB --- 20I-0900                                 |
;|SECTION - D                                              |
;|COAL_PROJECT                                             |
; ---------------------------------------------------------


.model small
.stack 1000h
.386
.data
       ;-----------------------------DATA DECLARATION-------------------------------------
       x dw ?            ;X-AXIS FOR PIXELS
	   y dw ?            ;Y-AXIS FOR PIXELS
	   count db 0        ;COUNTS THE LINES
	   tempvar dw ?      ;Temporary store x axis
	   temp dw ?         ;keep the end point for shapes
	   tempvar2 dw ?     ;temporary store x axis
	   tempvar3 dw ?     ;temporary store x axis
	   tempvar4 dw ?     ;temporary store x axis
	   random_check db ?  ;store random number
	   msg1 db "WELCOME TO CANDY CRUSH GAME"
       msg2 db "PRESS ENTER TO CONTINUE_____!"
	   R db "RULES"
       R1  db "1)THERE ARE 3 LEVELS"
       R2 db "2)YOU CAN ONLY SWAP TWO ADJACENT CANDIES"
       R3 db "3)MAKE ATLEAST 3 MATCHING RANDOM CANDIES"
       GL db "BEST OF LUCK!"
       enterBUTTON db "PRESS ENTER TO PLAY!"
      
	   mystr db 'ENTER YOUR NAME: '
       filename db 'player.txt',0 ;filename
       fhandle dw ?                ;contain what should be write in file
       myplayer db 100 dup('$')    ;contain the player name
	   
	   mylevel db "LEVEL : "
	  
	   myscore db "SCORE : "
	   mygame db "CANDY CRUSH"
	   mymove db "MOVE : "
	   over db "GAMEOVER"
	   counter1 db ?   ;check for random candies filling
	   counter2 db ?   ;check for random candies filling
	   temporary1 dw ?  ;temporary store x axis
	   temporary2 dw ?  ;temporary store y axis
	   temporary3 dw ?   ;temporary store x axis
	   M1 db "PRESS 1) LEVEL 1"
	   M2 db "PRESS 2) LEVEL 2"
	   M3 db "PRESS 3) LEVEL 3"
	   M4 db "ENTER HERE:::"
	   level db ?    ;keep the record for each level
	   score db ?    ;keep the score for each level
	   moves db 15   ;check number of moves
	   
	   E1 db "ENTER Y) YES"  
	   E2 db "ENTER N) NO"
	   E3 db "DO YOU WANT TO PLAY AGAIN"
	   bomb_str db "BOMB" ;string to display bomb
	   lines db "____________________________________________"
	   T db "THANK_YOU"
	   tempL db ?
	   tempM db ?
	   tempS db ?
	   
	 
	  
	   
	  
.code
      
      jmp main
	  
	  ;-------------horizontal line proc that draw a single horizontal line---------------
      horizontalline proc
	             L1:
				 mov ah,0ch    
	              mov al,0Fh   ;color of line
				   mov cx,x    ; x-coordinate
		           mov dx,y    ; y-coordinate
		           int 10h
		           inc x
		           cmp x,240
	               jne L1
				   ret
                   horizontalline endp
		;-------------verticalline proc draw a single vertical line--------------------	   
		 verticalline proc
		         
		         L2:
				      mov ah,0ch
					  mov al,0Fh   ;color of line
					  mov cx,x     ;x-coordinate
					  mov dx,y     ;y-coordinate
					  int 10h
					  inc y
					  cmp y,190
					  jne L2
					  ret
					  verticalline endp
		;----------------these blocks are for level 3 a horizontal and vertical both way----------------------			  
					  
		blocks proc
		                mov cx,23          ;loop condition
						mov y,99           ;y coordinate of blocks
		                jump1:
						      mov x,80
							  push cx
						       
					    L1:
					   
				       mov ah,0ch
	                   mov al,07h     ;block color
				       mov cx,x       ;x coordinate for pixel
		               mov dx,y       ;y coordinate for pixel
		               int 10h
		               inc x
		               cmp x,241      ;check the width of block
	                   jne L1
					   
					   pop cx
					   inc y
					   loop jump1
					   
					  mov cx,23    ;loop condition
					  mov x,149    ;x coordinate of blocks
					  jump2:
					        mov y,30
					        push cx
					   
					  L2:
					   
					  mov ah,0ch
					  mov al,07h    ;block color
					  mov cx,x      ;x coordinate
					  mov dx,y      ;y coordinate
					  int 10h
					  inc y
					  cmp y,191     ;check the height of block
					  jne L2
					  pop cx
					  inc x
					  loop jump2
					  
					  ret
					  
					  blocks endp
		;---------------------there hurdles are for level2 according to given instructions---------------------------
					  
					  
		hurdles proc
		
		                mov cx,46         ;loop condition
						mov y,30
		                jump1:
						      mov x,80
							  push cx
						       
					    L1:
					   
				       mov ah,0ch
	                   mov al,07h   ;color of hurdle
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,103   ;check for width
	                   jne L1
					   
					   pop cx
					   inc y
					   loop jump1
					   
					   
					    mov cx,46   ;loop condition
					    mov y,30
		                jump2:
						      mov x,217
							  push cx
						       
					    L2:
					   
				       mov ah,0ch
	                   mov al,07h
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,240   ;check for width
	                   jne L2
					   
					   pop cx
					   inc y
					   loop jump2
					   
					   
					    mov cx,46   ;loop condition
					    mov y,145
		                jump3:
						      mov x,80
							  push cx
						       
					    L3:
					   
				       mov ah,0ch
	                   mov al,07h      ;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,103    ;width of hurdle
	                   jne L3
					   
					   pop cx
					   inc y
					   loop jump3
					   
					   
					   
					    mov cx,46 ;condition check
					    mov y,145
		                jump4:
						mov x,217
					    push cx
						       
					    L4:
					   
				       mov ah,0ch
	                   mov al,07h ;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,240 ;width check
	                   jne L4
					   
					   pop cx
					   inc y
					   loop jump4
					   
					   
					   
					    mov cx,23 ;loop condition
					    mov y,30
		                jump5:
						      mov x,149
							  push cx
						       
					    L5:
					   
				       mov ah,0ch
	                   mov al,07h;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,172 ;width of hurdle
	                   jne L5
					   
					   pop cx
					   inc y
					   loop jump5
					   
					   
					    mov cx,23 ;loop condition
						
					    mov y,167
		                jump6:
						      mov x,149
							  push cx
						       
					    L6:
					   
				       mov ah,0ch
	                   mov al,07h  ;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,172 ;width check
	                   jne L6
					   
					   pop cx
					   inc y
					   loop jump6
					   
					   
					    mov cx,23
					    mov y,99
		                jump7:
						      mov x,80
							  push cx
						       
					    L7:
					   
				       mov ah,0ch
	                   mov al,07h ;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,103 ;width check
	                   jne L7
					   
					   pop cx
					   inc y
					   loop jump7
					   
					   
					    mov cx,23
					    mov y,99
		                jump8:
						      mov x,217
							  push cx
						       
					    L8:
					   
				       mov ah,0ch
	                   mov al,07h  ;color set
				       mov cx,x
		               mov dx,y
		               int 10h
		               inc x
		               cmp x,240   ;width color
	                   jne L8
					   
					   pop cx
					   inc y
					   loop jump8
					   
					   ret
					   
					   hurdles endp
		              
		             
					 
		;---------------------this program draws a single square shape on grid-----------------------------------	
        ;x contain x coordinate of pixel
        ;y contain y coordinate of pixel
        ;temp is the width of shape
        ;tempvar stores the x and y temporary bcz of logic		
					  
		draw_square_shape proc
		 
		       
				  mov bx,x
				  mov tempvar,bx
	              jump1:
	 
                   mov ah,0ch
	               mov al,0Eh
	  
	               mov cx,x
		           mov dx,y
		           int 10h
		           inc x
				   mov bx,x
		           cmp bx,temp
	               jne jump1
				   
				   
				   shape_check1:
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					  
					  
					   jump2:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump2


                     shape_check2:
				     
					  mov bx,tempvar
					  mov x,bx
					  inc y
					  
					  
					   jump3:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump3
					  
					  
					  shape_check3:
				     
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					   jump4:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump4
	                  
					  
					  shape_check4:
				   
					  mov bx,tempvar
					  mov x,bx
					  inc y
					
					  
					   jump5:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump5
					  
					  
					  shape_check5:
				    
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump6:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump6
					  
					  
					  shape_check6:
				     
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump7:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne jump7
					  
					  
					 shape_check7:
					 
					 
				     
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump8:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump8
					  
					  shape_check8:
					 
					 
				    
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump9:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump9
					  
					  
					  shape_check9:
					 
					 
				    
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump10:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump10
					  
					  
                    shape_check10:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump11:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump11
					  
					  
					   shape_check11:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump12:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump12
					  
					  
					   shape_check12:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump13:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump13
					  
					  
					 shape_check13:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump14:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump14
					  
					  
					  
					  shape_check14:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump15:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump15
					  
					  
					  shape_check15:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump16:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump16
					  
					  
					   shape_check16:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  inc y
					 
					  
					   jump17:
	 
                      mov ah,0ch
                      mov al,0Eh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump17
					  
					  
					  
					  shape_check17:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  dec y
					  dec y
					  dec y
					  
					   jump18:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump18
					  
					  
					  
					  shape_check18:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  dec y
					  dec y
					  dec y
					  
					   jump19:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump19
					  
					  shape_check19:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  dec y
					  dec y
					  dec y
					  
					   jump20:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump20
					  
					  
                     shape_check20:
					 
					 
				      
					  mov bx,tempvar
					  mov x,bx
					  dec y
					  dec y
					  dec y
					  
					   jump21:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne jump21
					  
					  
				   
				  
				   ret
                   draw_square_shape endp
				   
				   ;--------------------------this program draw diamond shape on grid----------------------------------
	    ;x contain x coordinate of pixel
        ;y contain y coordinate of pixel
        ;temp is the width of shape
        ;tempvar stores the x and y temporary bcz of logic	
				   
				   draw_diamond_shape proc
		 
		       
				  mov bx,x
				  mov tempvar2,bx
	              check1:
	 
                   mov ah,0ch
	               mov al,0Ch
	  
	               mov cx,x
		           mov dx,y
		           int 10h
		           inc x
				   mov bx,x
		           cmp bx,temp
	               jne check1
				   
				   
				   trishape_check1:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check2:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check2


                     trishape_check2:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check3:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check3
					  
					  
					  trishape_check3:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check4:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check4
	                  
					  
					  trishape_check4:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check5:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check5
					  
					  
					  trishape_check5:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check6:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check6
					  
					  
					  trishape_check6:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check7:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check7
					  
					  
					 trishape_check7:
					 
					 
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check8:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check8
					  
					  trishape_check8:
					 
					 
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check9:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check9
					  
					  
					  trishape_check9:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					   check10:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check10
					  
					  
                      trishape_check10:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check11:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check11
					  
					  
					  trishape_check11:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check12:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check12
					  
					  trishape_check12:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check13:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check13
					  
					   trishape_check13:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check14:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check14
					  
					    trishape_check14:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check15:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check15
					  
					  
					 trishape_check15:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check16:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check16
					  
					  trishape_check16:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check17:
	 
                      mov ah,0ch
                      mov al,0Ch
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check17
					  
					  
					
				  
				   ret
                   draw_diamond_shape endp
				   
				   ;----------------------------------this program draw triangle shape on grid---------------------------------
	    ;x contain x coordinate of pixel
        ;y contain y coordinate of pixel
        ;temp is the width of shape
        ;tempvar stores the x and y temporary bcz of logic	
				   
				  draw_triangle_shape proc
		 
		       
				  mov bx,x
				  mov tempvar3,bx
	              check1:
	 
                   mov ah,0ch
	               mov al,05h
	  
	               mov cx,x
		           mov dx,y
		           int 10h
		           inc x
				   mov bx,x
		           cmp bx,temp
	               jne check1
				   
				   
				   daishape_check1:
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check2:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check2


                     daishape_check2:
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check3:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check3
					  
					  
					  daishape_check3:
				      
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check4:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check4
	                  
					  
					  daishape_check4:
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check5:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check5
					  
					  
					  daishape_check5:
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check6:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check6
					  
					  
					  daishape_check6:
				      
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check7:
	 
                      mov ah,0ch
                      mov al,05H
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check7
					  
					  
					 daishape_check7:
					 
					 
				    
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check8:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check8
					  
					  daishape_check8:
					 
					 
				    
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check9:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check9
					  
					  
					  daishape_check9:
					 
					 
				   
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check10:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check10
					  
					  
                      daishape_check10:
					 
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check11:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check11
					  
					  
					  daishape_check11:
					 
					 
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check12:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check12
					  
					  daishape_check12:
					 
					 
				      
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check13:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check13
					  
					   daishape_check13:
					 
					 
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check14:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check14
					  
					  daishape_check14:
					 
					 
				    
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check15:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check15
					  
					  
					 daishape_check15:
					 
					 
				   
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check16:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check16
					  
					  daishape_check16:
					 
					 
				     
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					  check17:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check17
					  
					  
				
					  
					
				  
				   ret
                   draw_triangle_shape endp
				   
				   
				 ;------------------------------this program display circle candy on grid---------------------------------
	    ;x contain x coordinate of pixel
        ;y contain y coordinate of pixel
        ;temp is the width of shape
        ;tempvar stores the x and y temporary bcz of logic	
				   
				    draw_circle_shape proc
		 
		       
				
				  mov bx,x
				  mov tempvar2,bx
	              check1:
	 
                   mov ah,0ch
	               mov al,0Fh
	  
	               mov cx,x
		           mov dx,y
		           int 10h
		           inc x
				   mov bx,x
		           cmp bx,temp
	               jne check1
				   
				   
				   trishape_check1:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check2:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check2


                     trishape_check2:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check3:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check3
					  
					  
					  trishape_check3:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check4:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check4
	                  
					  
					  trishape_check4:
				      dec tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  inc temp
					  
					   check5:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check5
					  
					  
					  trishape_check5:
				     
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					 
					  
					   check6:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check6
					  
					  
					  trishape_check6:
				      
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  
					  
					   check7:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check7
					  
					  
					
					  
					  
					  trishape_check9:
					 
					 
				      
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  
					  
					   check10:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check10
					  
					  
                      trishape_check10:
					 
					 
				      
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  
					  
					  check11:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check11
					  
					  
					  trishape_check11:
					 
					 
				      
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  
					  
					  check12:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check12
					  
					  trishape_check12:
					 
					 
				      
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  
					  
					  check13:
	 
                      mov ah,0ch
                      mov al,05h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check13
					  
					   trishape_check13:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check14:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check14
					  
					    trishape_check14:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check15:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check15
					  
					  
					 trishape_check15:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check16:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check16
					
					  
					  trishape_check16:
					 
					 
				      inc tempvar2
					  mov bx,tempvar2
					  mov x,bx
					  inc y
					  dec temp
					  
					  check17:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
					  
	                  jne check17
					  
					  
					  
				  
				   ret
                   draw_circle_shape endp
				   
				  
				   
				   ;----------------------------this proc display candy on grid---------------------------------
		;x contain x coordinate of pixel
        ;y contain y coordinate of pixel
        ;temp is the width of shape
        ;tempvar stores the x and y temporary bcz of logic	
				   draw_candy_shape proc
		 
		       
				  mov bx,x
				  mov tempvar3,bx
	              check1:
	 
                   mov ah,0ch
	               mov al,04h
	  
	               mov cx,x
		           mov dx,y
		           int 10h
		           inc x
				   mov bx,x
		           cmp bx,temp
	               jne check1
				   
				   
				   daishape_check1:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check2:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check2


                   
				   daishape_check2:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check3:
	 
                      mov ah,0ch
                      mov al,0Fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check3
					  
					
				   daishape_check3:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check4:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check4


               daishape_check4:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check5:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check5
					  
				  daishape_check5:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check6:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check6
					    
				
                    
				daishape_check6:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check7:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check7
					  
				daishape_check7:
				     inc tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  dec temp
					  
					   check8:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check8
					  
					  
				daishape_check8:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check9:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check9
					  
				daishape_check9:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check10:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check10

                daishape_check10:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check11:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check11

                daishape_check11:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check12:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check12	

               daishape_check12:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check13:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check13	

                daishape_check13:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check14:
	 
                      mov ah,0ch
                      mov al,04h
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check14

               	daishape_check14:
				      dec tempvar3
					  mov bx,tempvar3
					  mov x,bx
					  inc y
					  inc temp
					  
					   check15:
	 
                      mov ah,0ch
                      mov al,0fh
	  
	                  mov cx,x
		              mov dx,y
		              int 10h
		              inc x
					  mov bx,x
                      cmp bx,temp
	                  jne check15
					  
					  
					
				
					    	  
					  
				
					  
					
				  
				   ret
                   draw_candy_shape endp
				   
				   
				   ;---------------------------------this function is to delay time for micro_seconds------------------------
				   
				   
				   delay_time proc
				       
					     mov cx,0
	                    jump:
	                             mov bx,0
                                 cmp cx,200
	                             je barrier
	                              inc cx
                                  jump1:
	                                  cmp bx,400
	                                  je jump
                                       inc bx	
	                                    jmp jump1
	                                    barrier:
	                                     ret
									 delay_time endp
							   
							   
				         
				   
				    
				   ;---------------------------this function generates random number from 0-4 range--------------------------------------
				   
				   random_number proc
				   
				          call delay_time
						  MOV AH, 0h  ; interrupts to get system time        
                          INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

                          mov  ax, dx
                          mov dx,0
                         mov  bx,5
                         div  bx 
						  mov random_check,dl
						   
						   ret
						   random_number endp
						   
		 
		 
						   
        
						   
						   
		   ;--------------------------this function is to move program to video mode and set background--------------------------------


			video_mode proc

			 mov ah,00h
	         mov al,13
	         int 10h   ;interupt for video mode
	  
	  
	         mov ah,0bh
             mov bh,00h
	         mov bl,00h
	         int 10h
	         ret 
	         video_mode endp
	   
	 ;-------------------------------this funtion displays first page intro of game--------------------------------------------  
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	FIRST_PAGE proc
	

	mov al, 0
	mov bh, 0
	mov bl, 0Ch
	mov cx, 40
	mov dl, 0
	mov dh, 3	
	push ds
	pop es
	mov bp, offset lines
	mov ah, 13h
	int 10h
	
	mov cx, 27
	mov dl, 6	
	mov dh, 8	
	mov bp, offset msg1
	mov ah,13h
	int 10h
	

	mov cx, 28
	mov dl, 7	
	mov dh, 14	
	mov bp, offset msg2
	mov ah,13h
	int 10h
	
	
	mov cx, 40
	mov dl, 0	
	mov dh, 17	
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	J1:
		mov ah,00
		int 16h
		cmp al,13
		JNE J1
     ret
     FIRST_PAGE endp
	 
	 
	;------------------------------this function display rules of games-------------------------------------------------
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	 
	 Rules proc
	 
	

	mov al, 0
	mov bh, 0
	mov bl, 0Ch
	mov cx, 40
	mov dl, 0	
	mov dh, 0	
	push ds
	pop es
	mov bp, offset lines
	mov ah, 13h
	int 10h
	
	mov cx, 5
	mov dl, 17	
	mov dh, 2	
	mov bp, offset R
	mov ah,13h
	int 10h
	
	mov cx, 20
	mov dl, 0	
	mov dh, 5	
	mov bp, offset R1
	mov ah,13h
	int 10h
	
	
	mov cx, 40  
	mov dl, 0	
	mov dh, 8	
	mov bp, offset R2
	mov ah,13h
	int 10h
	
	
	mov cx, 40
	mov dl, 0	
	mov dh, 11	
	mov bp, offset R3
	mov ah,13h
	int 10h
	
	
	mov cx, 13
	mov dl, 14	
	mov dh, 15	
	mov bp, offset GL
	mov ah,13h
	int 10h
	
	
	mov cx, 20 
	mov dl, 10	
	mov dh, 18	
	mov bp, offset enterBUTTON
	mov ah,13h
	int 10h
	
	
	mov cx, 40 
	mov dl, 0	
	mov dh, 20	
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	J1:
		mov ah,00
		int 16h
		cmp al,13
		JNE J1
ret
Rules endp

    ;-----------------------------------this function takes data from user---------------------------------
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
    Data proc
	
	
	
	
	mov ah,02h
	mov bh,00h
	mov dh,7
	mov dl,19 	
	int 10h
	
	
	mov al, 0
	mov bh, 0
	mov bl, 0Ch
	mov cx, 40
	mov dl, 0	
	mov dh, 0	
	push ds
	pop es
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	mov cx, 17
	mov dl, 3	
	mov dh, 7	
	mov bp, offset mystr
	mov ah,13h
	int 10h
	
	mov cx, 40
	mov dl, 0	
	mov dh, 10	
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	mov ah,3ch 
	mov si,offset filename
	mov dx,si
	mov cl,0
	int 21h
	
	mov fhandle,ax
	

	mov si,0
	mov cx,0
	;input of name

	J3:
	mov ah,01

	int 21h
	CMP al,13
	JE here

	mov myplayer[si],al
	inc si
	inc cx
	JMP J3
    
	;file handling to store name in file
	here:
	mov ah,40h 
	mov bx,fhandle
	mov si,offset myplayer
	mov dx,si
	int 21h

	mov ah,3eh 
	mov bx,fhandle
	int 21h
	

	
	ret
	Data endp
	
	;-----------------------------------------this proc display grid -----------------------------------------
	
	make_grid proc
	
	  check1:
	  mov x,80
	  mov y,30
	  mov count,0
	  call horizontalline 
	  
	  
	  ;	GRID FORMATION
	  LOOP2:
	        cmp count,7
			je check2
	        add y,23
			mov x,80
	        call horizontalline
		    inc count
			jmp LOOP2
			
			
	 check2:
	        mov x,80
			mov y,30
			mov count,0
			call verticalline
			
			LOOP3:
	        cmp count,6
			je lastline
	        add x,23
			mov y,30
	        call verticalline
		    inc count
			jmp LOOP3
			
	
			
	 lastline:
	        add x,22
			mov y,30

			call verticalline
			
			ret 
			make_grid endp
			
	;-----------------------------this proc display level,score and moves around the grid---------------------------------------
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	
     main_screen proc
	                  mov al, 0
	                  mov bh, 0
	                  mov bl, 0Ch
	                  mov cx, 11
	                  mov dl, 15	
	                  mov dh, 2	
	                  push ds
	                  pop es
	                  mov bp, offset mygame
	                  mov ah, 13h
	                  int 10h
	
	
	                  mov cx,8
	                  mov dl, 0	
	                  mov dh, 10
                      mov bp, offset mylevel
	                  mov ah,13h
                     int 10h
					 
					 
	
	
                 	mov cx, 8
	                mov dl, 31	
	                mov dh, 10	
	                mov bp, offset myscore
	                mov ah,13h
	                int 10h
					
					
					
                 	mov cx, 7
	                mov dl, 31	
	                mov dh, 13	
	                mov bp, offset mymove
	                mov ah,13h
	                int 10h
					
					
					call score_update
	
	          ret    

     main_screen endp
	 
	
	 
	 
	 ;------------------------------this proc display game over and next options-------------------------------------
	  ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	 game_over proc
	 
	                  mov al, 0
	                  mov bh, 0
	                  mov bl, 0Ch
	                  mov cx, 8
	                  mov dl, 15	
	                  mov dh, 11
	                  push ds
	                  pop es
	                  mov bp, offset over
	                  mov ah, 13h
	                  int 10h
					  
					  
					  mov cx, 28
	                  mov dl, 7	
	                  mov dh, 17	
	                  mov bp, offset msg2
	                  mov ah,13h
	                  int 10h
					  
					  mov cx, 40
	                  mov dl, 0	
	                  mov dh, 0
	                  mov bp, offset lines
	                  mov ah,13h
	                  int 10h
	
	                  mov cx, 40
	                  mov dl, 0	
	                  mov dh, 21
	                  mov bp, offset lines
	                  mov ah,13h
	                  int 10h
	
	
	J1:
		mov ah,00
		int 16h
		cmp al,13
		JNE J1
		
		call video_mode
		call end_page
					  
					  
	ret
	game_over endp
	
	
	;-------------------------this proc display menu to user that which level he/she wants to play------------------------------------
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	
	menu_board proc
	
	mov al, 0
	mov bh, 0
	mov bl, 0Ch
	mov cx, 11
	mov dl, 15	
	mov dh, 2	
	push ds
	pop es
	mov bp, offset mygame
	mov ah, 13h
	int 10h
	
	
	mov cx, 16
	mov dl, 2	
	mov dh, 5	
	mov bp, offset M1
	mov ah,13h
	int 10h
	
	
	mov cx, 16 
	mov dl, 2	
	mov dh, 8	
	mov bp, offset M2
	mov ah,13h
	int 10h
	
	
	mov cx, 16
	mov dl, 2	
	mov dh, 11	
	mov bp, offset M3
	mov ah,13h
	int 10h
	
	mov cx, 13
	mov dl, 2	
	mov dh, 14	
	mov bp, offset M4
	mov ah,13h
	int 10h
	
	
	mov cx, 40
	mov dl, 0	
	mov dh, 0
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	mov cx, 40
	mov dl, 0	
	mov dh, 21
	mov bp, offset lines
	mov ah,13h
	int 10h
	
	
	mov ah,01
	int 21h
	cmp al,'1'
	je L1
	
	cmp al,'2'
	je L2
	
	cmp al,'3'
	je L3
	
	L1:
	    call level1
		jmp l4
		
	l2:
	   call level2
	   jmp l4
	l3:
	   call level3
	   jmp l4
	   
	l4:
	ret
	menu_board endp
	
	;-----------------------------------this function fill the grid with candies on the basis of random number generator-----------------------------------------------
	                
	
	grid_fill proc
	              
				  .if(random_check==0)
				    add x,4
					add y,4
					add temp,20
					call draw_square_shape
					
					.elseif(random_check==1)
					 add x,4
					 add y,4
					 add temp,5
					 call draw_triangle_shape
					 
					.elseif(random_check==2)
					 add x,11
					 add y,4
					 add temp,12
					 call draw_diamond_shape
					 
					 .elseif(random_check==3)
					 add x,4
					 add y,4
					 add temp,20
					 call draw_candy_shape
					 
					 .elseif(random_check==4)
					  add x,8
					  add y,4
					  add temp,15
					  call draw_circle_shape
					  
					
					  
					  .endif
					  
					  
					  ret
					  
					  grid_fill endp
					  
					  
	;---------------------------this function gives instructions where candies will be placed in grid--------------------------------
	
	
	random_grid_fill proc
	
	             
	             
				 mov temporary1,80
				 mov temporary2,30
				 mov temporary3,80
				 mov counter2,0
				 
				 check1:
				 mov counter1,0
				 
				 label1:
				          cmp counter1,7
						  je label3
						  mov bx,temporary1
						  mov x,bx
						  
						  mov bx,temporary2
						  mov y,bx
						  
						  mov bx,temporary1
						  mov temp,bx
						  
						  call random_number
						  call grid_fill
						  
						  add temporary1,23
						  inc counter1
						  
						  jmp label1
						  
						  
				label3:
				        mov bx,temporary3
						mov temporary1,bx
						add temporary2,23
						inc counter2
						cmp counter2,7
						jne check1
						je label4
						
						
						
				label4:
				        ret
						random_grid_fill endp
						
		   ;---------------------------------this proc contain all the process for level 1-----------------------------------
						
						
			level1 proc
			        
					mov level,1
					mov score,0
					mov moves,5
					loop1:
			        cmp moves,0
                    je return					
				    call video_mode
	                call main_screen
	                call make_grid
					call random_grid_fill
					call mouse_click
			
					call Display_bomb
					call delay_time
					add score,1
					dec moves
					jmp loop1
					
					return:
					call video_mode
					call game_over
					
					ret
					
					level1 endp
					
			;;-------------------------------this proc contain all the process for level 2----------------------------------------		
			level2 proc
			
			        mov level,2
					mov score,0
					mov moves,5
					loop1:
					cmp moves,0
					je return
			        call video_mode
	                call main_screen
	                call make_grid
					call random_grid_fill
					call hurdles
					call mouse_click
					call delay_time
					call Display_bomb
					call delay_time
					call delay_time
					add score,1
					dec moves
					jmp loop1
					
					return:
					call video_mode
					call game_over
				
					
					ret
					level2 endp
            ;--------------------------contain all the process for level 3-----------------------------------------		
			level3 proc
			        mov level,3
					mov score,0
					mov moves,5
					Loop1:
					cmp moves,0
					je return
			        call video_mode
	                call main_screen
	                call make_grid
					call random_grid_fill
					call blocks
					call mouse_click
					call delay_time
					call Display_bomb
					call delay_time
					call delay_time
					add score,1
					dec moves
					jmp loop1
					
					return:
					call video_mode
				
					call game_over
					
					ret
					level3 endp
					
			;--------------this proc lock the mouse inside the game screen------------------------		
		 mouse_lock proc
			            
						   mov ax,1
						   int 33h
						   ret
						   mouse_lock endp
		;---------------------this proc is use for mouse click-------------------------------			   
		mouse_click proc
		
		                  start:
						  mov ax,1
						  int 33h
						  mov ax,3
						  int 33h
						  
						  cmp bl,1
						  je jump
						  jne start
						 
						 jump:
						        ret
								mouse_click endp
    
	;-------------------------this proc ask the user to continue game--------------------------------------------
	 ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
	 end_page proc
	 
	         mov al, 0
	         mov bh, 0
	         mov bl, 0Ch
	         mov cx, 25
	         mov dl, 10
	         mov dh, 2	
             push ds
	         pop es
	         mov bp, offset E3
	         mov ah, 13h
	         int 10h
	
	
	         mov cx, 12
	         mov dl, 13
	         mov dh, 5	
	         mov bp, offset E1
	         mov ah,13h
	         int 10h
	
	
	         mov cx, 11
	         mov dl, 13	
	         mov dh, 8	
	         mov bp, offset E2
	         mov ah,13h
	         int 10h
			 
			  mov cx, 40
	          mov dl, 0	
	          mov dh, 0
	          mov bp, offset lines
	          mov ah,13h
	          int 10h
	
	          mov cx, 40
	          mov dl, 0	
	          mov dh, 21
	          mov bp, offset lines
	          mov ah,13h
	          int 10h
			 
			 
			 mov ah,01
			 int 21h
			 
			 cmp al,'y'
			 je jump
			 jne jump1
			 
			 jump:
			 call video_mode
			 call menu_board
			 
			jump1:
			call video_mode
			call Thank_you
	               
			ret
			
			end_page endp
			
			
		;------------------------------this proc display bomb when it is needed---------------------------------
     ;cx contain count of character
	 ;dl contain x-coordinate
	 ;dh contain y-coordinate
	 ;bp contain offset of message to display
	 ;bl contain color of text
				   
		Display_bomb proc
		
		              call video_mode
		
		              mov al, 0
	                  mov bh, 0
	                  mov bl, 0Ah
	                  mov cx, 4
	                  mov dl, 12	
	                  mov dh, 13
	                  push ds
	                  pop es
	                  mov bp, offset bomb_str
	                  mov ah, 13h
	                  int 10h
		         
				      call delay_time
					  call delay_time
	
                      mov al, 0
	                  mov bh, 0
	                  mov bl, 0Bh
	                  mov cx, 4
	                  mov dl, 15	
	                  mov dh, 13
	                  push ds
	                  pop es
	                  mov bp, offset bomb_str
	                  mov ah, 13h
	                  int 10h
					  
					  
					  call delay_time
					  call delay_time
	
                      mov al, 0
	                  mov bh, 0
	                  mov bl, 0Ch
	                  mov cx, 4
	                  mov dl, 18	
	                  mov dh, 13
	                  push ds
	                  pop es
	                  mov bp, offset bomb_str
	                  mov ah, 13h
	                  int 10h
		         
				 
				        call delay_time
					  call delay_time
	
                      mov al, 0
	                  mov bh, 0
	                  mov bl, 0Dh
	                  mov cx, 4
	                  mov dl, 21
	                  mov dh, 13
	                  push ds
	                  pop es
	                  mov bp, offset bomb_str
	                  mov ah, 13h
	                  int 10h
		         
	                 
					  
					  ret
					  Display_bomb endp
					  
					  ;------------------------------this function thank you at the end of game--------------------------------------------
					  Thank_you proc
					  
					  mov al, 0
	                  mov bh, 0
	                  mov bl, 0Ch
	                  mov cx, 9
	                  mov dl, 15
	                  mov dh, 11
	                  push ds
	                  pop es
	                  mov bp, offset T
	                  mov ah, 13h
	                  int 10h
					  
					   mov cx, 40
	                   mov dl, 0	
	                   mov dh, 0
					   mov bp, offset lines
					   mov ah,13h
	                   int 10h
	
	                   mov cx, 40
	                   mov dl, 0	
	                   mov dh, 21
	                   mov bp, offset lines
	                   mov ah,13h
	                   int 10h
					  
					  ret
					  Thank_you endp
					  
					  
					  score_update proc
					  
					  
					  mov bl,level
					  mov templ,bl
					  
					  add tempL,48
					  mov ax,@data
	                  mov es,ax 
    
                      mov bp, OFFSET tempL
                      mov ax, 1300h       
                      mov bh, 0
                      mov bl, 00001010b   ; color
                      mov cx, 1           ; length
                      mov dh, 10         ; y-axis
                      mov dl, 8			  ; x-axis
                      INT 10h
					  
					    
					  mov bl,score
					  mov tempS,bl
					  
					  add tempS,48
					  mov ax,@data
	                  mov es,ax 
    
                      mov bp, OFFSET tempS
                      mov ax, 1300h       
                      mov bh, 0
                      mov bl, 00001010b   ; color
                      mov cx, 1           ; length
                      mov dh, 10          ; y-axis
                      mov dl, 78          ; x-axis
                      INT 10h
					  
					    
					  mov bl,moves
					  mov tempM,bl
					  
					  
					  add tempM,48
					  mov ax,@data
	                  mov es,ax 
    
                      mov bp, OFFSET tempM
                      mov ax, 1300h       
                      mov bh, 0
                      mov bl, 00001010b   ; color
                      mov cx, 1           ; length
                      mov dh, 13          ; y-axis
                      mov dl, 78      ; x-axis
                      INT 10h
					   
					  ret 
					  score_update endp
		         
		         
		         
					  
			
					  
			
	 ;-------------------------main proc---------------------		
	  main proc 
    
	  
	  mov ax,@data
      mov ds,ax
      mov ax,0

      call video_mode
      call mouse_lock
      call FIRST_PAGE	  
	  call video_mode
      call RULES	  
	  call video_mode
	  call Data
	  call video_mode
	  call menu_board
	  call delay_time
	  call delay_time
	  call video_mode
      call end_page
	       
			
	  Exit:
	  mov ah,4ch
	  int 21h
	  
	  main endp
	  end main
	  
	  ;-------------------------------end of game--------------------------------------------