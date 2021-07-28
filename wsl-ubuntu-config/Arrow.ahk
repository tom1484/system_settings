SetBatchLines -1

SendMode Input

>+l::Send {Up}
Return
>+>::Send {Down}
Return
>+<::Send {Left}
Return
>+?::Send {Right}
Return

<^>+l::Send ^{Up}
Return
<^>+.::Send ^{Down}
Return
<^>+,::Send ^{Left}
Return
<^>+/::Send ^{Right}
Return

<+>+l::Send +{Up}
Return
<+>+.::Send +{Down}
Return
<+>+,::Send +{Left}
Return
<+>+/::Send +{Right}
Return

<^<+>+l::Send ^+{Up}
Return
<^<+>+.::Send ^+{Down}
Return
<^<+>+,::Send ^+{Left}
Return
<^<+>+/::Send ^+{Right}
Return

; !p::Send {Up}
; !;::Send {Down}
; !l::Send {Left}
; !'::Send {Right}

; <^!p::Send ^{Up}
; <^!;::Send ^{Down}
; <^!l::Send ^{Left}
; <^!'::Send ^{Right}

; <+!p::Send +{Up}
; <+!;::Send +{Down}
; <+!l::Send +{Left}
; <+!'::Send +{Right}

; <^<+!p::Send ^+{Up}
; <^<+!;::Send ^+{Down}
; <^<+!l::Send ^+{Left}
; <^<+!'::Send ^+{Right}

; Disable right shift
*>+q::Return
*>+a::Return
*>+z::Return
*>+w::Return
*>+s::Return
*>+x::Return
*>+e::Return
*>+d::Return
*>+c::Return
*>+r::Return
*>+f::Return
*>+v::Return
*>+t::Return
*>+g::Return
*>+b::Return
*>+y::Return
*>+h::Return
*>+n::Return
*>+u::Return
*>+j::Return
*>+m::Return
*>+i::Return
*>+k::Return
*>+o::Return
*>+p::Return
*>+;::Return
*>+[::Return
*>+'::Return
*>+]::Return
*>+\::Return
*>+`::Return
*>+1::Return
*>+2::Return
*>+3::Return
*>+4::Return
*>+5::Return
*>+6::Return
*>+7::Return
*>+8::Return
*>+9::Return
*>+0::Return
*>+-::Return
*>+=::Return
*>+Space::Return
