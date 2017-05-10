syntax match cType "[	 (]t_\w*[ 	*)]"
syntax match cType "^t_\w*[ 	*)]"
syntax match cOperator "[ 	]&&[ 	]"
syntax match cOperator "[ 	]||[ 	]"
syntax match cStruct "\w*->"
syntax match cStruct "\w*\."
highlight link cStruct Struct
