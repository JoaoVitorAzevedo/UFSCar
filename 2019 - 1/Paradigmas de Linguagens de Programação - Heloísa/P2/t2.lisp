;Fun��o que serve para construir a lista de pares da forma (elemento n�mero_de_repeti��es) de forma recursiva.
(defun encode (lista)
					(if (equal lista NIL)
						NIL
						(cons (list (car lista) (length (coleciona_repeticoes lista))) (encode (elimina_repeticao lista)))
					)
)

;Fun��o que serve para construir uma lista com todas as repeti��es consecutivas de um mesmo elemento
(defun coleciona_repeticoes(lista)
					(cond ((equal lista NIL) NIL)
						  ((equal (cdr lista) NIL) lista)
						  ((equal (car lista) (cadr lista))
								(cons (car lista) (coleciona_repeticoes (cdr lista))))
						   (t (list (car lista)))
					)
)

;Fun��o que serve para remover da cabe�a da lista uma sequ�ncia de elementos que se repetem consecutivamente
(defun elimina_repeticao(lista)
					(cond ((equal lista NIL) NIL)
						  ((equal (cdr lista) NIL) NIL)
						  ((equal (car lista) (cadr lista))
								(elimina_repeticao (cdr lista)))
						   (t (cdr lista))
					)
)