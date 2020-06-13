global brr := ["clashing ", "of ", "the swords ", "a nasheed ", "of ", "the defiant "]
global resting := 500
global infresting := 5
global visit := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
global perm := []
global mod := 1
global counter := 0
global s := brr.MaxIndex()

Fact(n){
	if(n==1){
		return 1
	}
	return n*Fact(n-1)
}

inform(){
	vare := Round(Fact(s)*(s/8+resting/100))
	vareh := Round(vare/3600, 2)
	Send, This will take about %vare% seconds (%vareh% hours).
	Send, {Enter}
}

informspec(){
	Send, Message here
	Send, {Enter}
}

Perm(){
	if(mod==s+1){
		if(Round(Mod(counter,infresting))==0){
			inform()
		}
		counter := counter + 1
		Loop, %s%
		{
			var := perm[A_Index]
			Send, %var%
		}
		Send, {Enter}
		Sleep, %resting%
	}
	Loop, %s%
	{
		if(visit[A_Index]==0)
		{
			visit[A_Index]:=1
			perm.Insert(mod, brr[A_Index])
			mod := mod+1
			Perm()
			visit[A_Index]:=0
			perm.remove(mod)
			mod := mod-1
		}
	}
}

^j::
Perm()
return


^q::
ExitApp