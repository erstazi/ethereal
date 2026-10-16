
-- poplar tree schematic

local t = {name = "ethereal:poplar_trunk", param1 = 255}
local T = {name = "ethereal:poplar_trunk", param1 = 255, force_place = true}
local a = {name = "ethereal:poplar_trunk", param1 = 255, param2 = 7}
local b = {name = "ethereal:poplar_trunk", param1 = 255, param2 = 13}
local P = {name = "ethereal:poplar_leaves_red", param1 = 255}
local _ = {name = "air", param1 = 255}

ethereal.poplar_tree = {

	size = {x=7, y=10, z=7},

	yslice_prob = {
		{ypos = 1, prob = 127},
		{ypos = 4, prob = 127},
		{ypos = 5, prob = 127}
	},

	data = {

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,P,P,_,_,
_,_,P,P,P,P,_,
_,_,P,P,P,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,P,P,P,_,_,
_,P,P,P,P,P,_,
_,P,P,P,P,P,_,
_,P,P,P,P,P,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,P,P,P,P,P,_,
P,P,P,P,P,P,P,
P,P,P,a,P,P,P,
P,P,P,P,P,P,P,
_,P,P,P,P,P,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,t,_,_,_,
_,_,_,t,_,_,_,
P,P,P,t,P,P,P,
P,P,P,t,P,P,P,
P,P,b,P,b,P,P,
P,P,P,P,P,P,P,
_,P,P,P,P,P,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,P,P,P,P,P,_,
P,P,P,P,P,P,P,
P,P,P,a,P,P,P,
P,P,P,P,P,P,P,
_,P,P,P,P,P,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,P,P,P,_,_,
_,P,P,P,P,P,_,
_,P,P,P,P,P,_,
_,_,P,P,P,_,_,
_,_,_,P,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,P,P,P,_,_,
_,_,P,P,P,_,_,
_,_,P,P,P,_,_,
_,_,_,P,_,_,_,
_,_,_,_,_,_,_,

	}
}
