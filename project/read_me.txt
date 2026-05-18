

Function / Signal	Top Module Port	Board Pin	Notes
Clock	clk	N11	100 MHz onboard clock
Reset	rst	L5	SW0 (active high)
Vote Buttons	btn_dmk	K13	Pushbutton top
btn_admk	L14	Pushbutton bottom
btn_tvk	M12	Pushbutton left
btn_ntk	L13	Pushbutton right
btn_other	M14	Pushbutton center
Mode Select	mode	L4	SW1 → 0=Prediction, 1=Actual
Vote Enable	vote_en	M4	SW2 → Enable/disable counting
Party/Total Select	sw[0]	M2	Party select bit0
sw[1]	M1	Party select bit1
sw[2]	N3	Party select bit2
sw[3]	N2	Party select bit3 (unused in logic)
sw[4]	N1	Total/party toggle
VGA Sync	hsync	F14	VGA HSYNC
vsync	H16	VGA VSYNC
VGA RGB	rgb[11]	E16	Red[3]
rgb[10]	F13	Red[2]
rgb[9]	F12	Red[1]
rgb[8]	D15	Red[0]
rgb[7]	H11	Green[3]
rgb[6]	E15	Green[2]
rgb[5]	F15	Green[1]
rgb[4]	D16	Green[0]
rgb[3]	G14	Blue[3]
rgb[2]	H13	Blue[2]
rgb[1]	H12	Blue[1]
rgb[0]	G12	Blue[0]
7‑Segment Digits	digit[0]	F2	AN0
digit[1]	E1	AN1
digit[2]	G5	AN2
digit[3]	G4	AN3
7‑Segment Segments	seg[0]	G2	Segment A
seg[1]	G1	Segment B
seg[2]	H5	Segment C
seg[3]	H4	Segment D
seg[4]	J5	Segment E
seg[5]	J4	Segment F
seg[6]	H2	Segment G
seg[7]	H1	Decimal Point