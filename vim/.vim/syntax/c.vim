syntax match cType "[	 (]t_\w*[ 	*)]"
syntax match cType "^t_\w*[ 	*])*"
syntax match cOperator "[ 	]&&[ 	]"
syntax match cOperator "[ 	]||[ 	]"
syntax match cStruct "\w*->"
syntax match EmptyLines "^$"
syntax match cStruct "(*\**\w*)*->"
syntax match cStruct "\w*\."
syntax keyword cConstant FALSE TRUE
highlight link cStruct Struct
