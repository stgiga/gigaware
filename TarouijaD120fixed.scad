//Disdyakis Triacontahedron
// 3 sided faces = 120
//degree 4 vertices = 30
//degree 6 vertices = 20
//degree 10 vertices = 12

// Depth of the labels on the faces
txt_depth = .26;
// Size of the label text. Warning: a scale factor is applied later (see below)
txt_size = .50;
// Font to be used for the text
txt_font = "Unifont Smooth";
// Scale factor which sets the diameter (distance from one vertex to the vertex opposite) 
diam = 64;
//Parameter to chamfer the edges [0 = disabled]
minko = 0.2; 
//Parameter to round the dice (intersects with a smaller sphere) [ disabled when negative]
roll = -0.1; 
//Sets the $fn variable (how fine the chamfer and the rounding will be)
minkfn = 80; 

//default labeling, "space"s added to adjust text on the faces
labels=["🂡","🂢","🂣","🂤","🂥","🂦","🂧","🂨","🂩","🂪","🂫","🂬","🂭","🂮","🂱","🂲","🂳","🂴","🂵","🂶","🂷","🂸","🂹","🂺","🂻","🂼","🂽","🂾","🃁","🃂","🃃","🃄","🃅","🃆","🃇","🃈","🃉","🃊","🃋","🃌","🃍","🃎","🃏","🃑","🃒","🃓","🃔","🃕","🃖","🃗","🃘","🃙","🃚","🃛","🃜","🃝","🃞","🃟","🃠","🃡","🃢","🃣","🃤","🃥","🃦","🃧","🃨","🃩","🃪","🃫","🃬","🃭","🃮","🃯","🃰","🃱","🃲","🃳","🃴","🃵","𝟶","𝟷","𝟸","𝟹","𝟺","𝟻","𝟼.","𝟽","𝟾","𝟿.","𝙰","𝙱","𝙲","𝙳","𝙴","𝙵","𝙶","𝙷","𝙸","𝙹","𝙺","𝙻","𝙼","𝙽","𝙾","𝙿","𝚀","𝚁","𝚂","𝚃","𝚄","𝚅","𝚆","𝚇","𝚈","𝚉","👍.","👎.","⎆","⎋"]; 

// Setting up rotation of the labels on the faces. Change the labels one by one to something with clear angles to set this up, e.g. "_|_", "|__",  "-|---", etc. Use such labelings and align them with features (e.g. edges); increase text depth if necessary.
facerot= [
    32,108,106,159,153,206,200,254,252,326,
    214,288,284,339,333,26,20,74,72,146,
    32,108,106,159,153,206,200,254,252,326,
    214,288,284,339,333,26,20,74,72,146,
    90,158,164,233,237,301,308,15,22,90,
    -90,-22,-16,53,57,121,128,195,212,-90,
    -90,-22,-16,53,57,121,128,195,212,-90,
    90,158,164,233,237,301,308,15,22,90,
    180,240,242,305,321,40,54,119,119,180,
    0,60,62,125,149,220,234,299,299,0,
    180,240,242,305,321,40,54,119,119,180,
    0,60,62,125,142,220,230,299,299,0,
    ];

// Setting up a translation so that the labels besser fits on the face. 
Ct = 0.11;
facetrans= [
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,Ct,-Ct,
    ];


// coordinate source:  http://dmccooey.com/polyhedra/DisdyakisTriacontahedron.txt

module stop_customizer() {} // just preventing fixed data of the solid to go in the customizer


C0 = 1.17518645301134929748244365923;
C1 = 1.38196601125010515179541316563;
C2 = 1.901491624090794379859549273853;
C3 = 2.17082039324993690892275210062;
C4 = 2.23606797749978969640917366873;
C5 = 3.07667807710214367734199293309;
C6 = 3.51246117974981072676825630186;
C7 = 3.61803398874989484820458683437;
C8 = 3.80298324818158875971909854771;

ordi = sqrt(C3*C3+C6*C6)+minko; //original diameter
scafa = diam*.5/ordi; //scale factor

vertices = [
[0.0, 0.0,  C8],
[0.0, 0.0, -C8],
[ C8, 0.0, 0.0],
[-C8, 0.0, 0.0],
[0.0,  C8, 0.0],
[0.0, -C8, 0.0],
[0.0,  C1,  C7],
[0.0,  C1, -C7],
[0.0, -C1,  C7],
[0.0, -C1, -C7],
[ C7, 0.0,  C1],
[ C7, 0.0, -C1],
[-C7, 0.0,  C1],
[-C7, 0.0, -C1],
[ C1,  C7, 0.0],
[ C1, -C7, 0.0],
[-C1,  C7, 0.0],
[-C1, -C7, 0.0],
[ C3, 0.0,  C6],
[ C3, 0.0, -C6],
[-C3, 0.0,  C6],
[-C3, 0.0, -C6],
[ C6,  C3, 0.0],
[ C6, -C3, 0.0],
[-C6,  C3, 0.0],
[-C6, -C3, 0.0],
[0.0,  C6,  C3],
[0.0,  C6, -C3],
[0.0, -C6,  C3],
[0.0, -C6, -C3],
[ C0,  C2,  C5],
[ C0,  C2, -C5],
[ C0, -C2,  C5],
[ C0, -C2, -C5],
[-C0,  C2,  C5],
[-C0,  C2, -C5],
[-C0, -C2,  C5],
[-C0, -C2, -C5],
[ C5,  C0,  C2],
[ C5,  C0, -C2],
[ C5, -C0,  C2],
[ C5, -C0, -C2],
[-C5,  C0,  C2],
[-C5,  C0, -C2],
[-C5, -C0,  C2],
[-C5, -C0, -C2],
[ C2,  C5,  C0],
[ C2,  C5, -C0],
[ C2, -C5,  C0],
[ C2, -C5, -C0],
[-C2,  C5,  C0],
[-C2,  C5, -C0],
[-C2, -C5,  C0],
[-C2, -C5, -C0],
[ C4,  C4,  C4],
[ C4,  C4, -C4],
[ C4, -C4,  C4],
[ C4, -C4, -C4],
[-C4,  C4,  C4],
[-C4,  C4, -C4],
[-C4, -C4,  C4],
[-C4, -C4, -C4]];
faces = [
[  8 ,  0, 18],
[ 32 ,  8, 18],
[ 56 , 32, 18],
[ 40 , 56, 18],
[ 10 , 40, 18],
[ 38 , 10, 18],
[ 54 , 38, 18],
[ 30 , 54, 18],
[  6 , 30, 18],
[  0 ,  6, 18],
[  7 ,  1, 19],
[ 31 ,  7, 19],
[ 55 , 31, 19],
[ 39 , 55, 19],
[ 11 , 39, 19],
[ 41 , 11, 19],
[ 57 , 41, 19],
[ 33 , 57, 19],
[  9 , 33, 19],
[  1 ,  9, 19],
[  6 ,  0, 20],
[ 34 ,  6, 20],
[ 58 , 34, 20],
[ 42 , 58, 20],
[ 12 , 42, 20],
[ 44 , 12, 20],
[ 60 , 44, 20],
[ 36 , 60, 20],
[  8 , 36, 20],
[  0 ,  8, 20],
[  9 ,  1, 21],
[ 37 ,  9, 21],
[ 61 , 37, 21],
[ 45 , 61, 21],
[ 13 , 45, 21],
[ 43 , 13, 21],
[ 59 , 43, 21],
[ 35 , 59, 21],
[  7 , 35, 21],
[  1 ,  7, 21],
[ 11 ,  2, 22],
[ 39 , 11, 22],
[ 55 , 39, 22],
[ 47 , 55, 22],
[ 14 , 47, 22],
[ 46 , 14, 22],
[ 54 , 46, 22],
[ 38 , 54, 22],
[ 10 , 38, 22],
[  2 , 10, 22],
[ 10 ,  2, 23],
[ 40 , 10, 23],
[ 56 , 40, 23],
[ 48 , 56, 23],
[ 15 , 48, 23],
[ 49 , 15, 23],
[ 57 , 49, 23],
[ 41 , 57, 23],
[ 11 , 41, 23],
[  2 , 11, 23],
[ 12 ,  3, 24],
[ 42 , 12, 24],
[ 58 , 42, 24],
[ 50 , 58, 24],
[ 16 , 50, 24],
[ 51 , 16, 24],
[ 59 , 51, 24],
[ 43 , 59, 24],
[ 13 , 43, 24],
[  3 , 13, 24],
[ 13 ,  3, 25],
[ 45 , 13, 25],
[ 61 , 45, 25],
[ 53 , 61, 25],
[ 17 , 53, 25],
[ 52 , 17, 25],
[ 60 , 52, 25],
[ 44 , 60, 25],
[ 12 , 44, 25],
[  3 , 12, 25],
[ 16 ,  4, 26],
[ 50 , 16, 26],
[ 58 , 50, 26],
[ 34 , 58, 26],
[  6 , 34, 26],
[ 30 ,  6, 26],
[ 54 , 30, 26],
[ 46 , 54, 26],
[ 14 , 46, 26],
[  4 , 14, 26],
[ 14 ,  4, 27],
[ 47 , 14, 27],
[ 55 , 47, 27],
[ 31 , 55, 27],
[  7 , 31, 27],
[ 35 ,  7, 27],
[ 59 , 35, 27],
[ 51 , 59, 27],
[ 16 , 51, 27],
[  4 , 16, 27],
[ 15 ,  5, 28],
[ 48 , 15, 28],
[ 56 , 48, 28],
[ 32 , 56, 28],
[  8 , 32, 28],
[ 36 ,  8, 28],
[ 60 , 36, 28],
[ 52 , 60, 28],
[ 17 , 52, 28],
[  5 , 17, 28],
[ 17 ,  5, 29],
[ 53 , 17, 29],
[ 61 , 53, 29],
[ 37 , 61, 29],
[  9 , 37, 29],
[ 33 ,  9, 29],
[ 57 , 33, 29],
[ 49 , 57, 29],
[ 15 , 49, 29],
[  5 , 15, 29]];

function add3(v, i = 0, r) = 
    i < len(v) ? 
        i == 0 ?
            add3(v, 1, v[0]) :
            add3(v, i + 1, r + v[i]) :
        r;

function facecoord(n) = [for(i = [0 : len(faces[n]) - 1]) vertices[faces[n][i]] ]; // returns list of the coordinates of the vertices on this face
    
module facetext(vert,txt,rot,trans) {
    bar = add3(vert)/len(vert); // barycentre
    length = norm(bar);     // radial distance
    b = acos(bar.z/length); // inclination angle
    c = atan2(bar.y,bar.x); // azimuthal angle
    rotate([0,b,c]) translate([0,0,length +minko]) rotate([0,0,rot]) translate([0,trans,0]) linear_extrude(txt_depth,center=true) text(text=txt,size = txt_size, font=txt_font, halign = "center", valign = "center");
}

scale(scafa)
difference() {
    intersection() {
        minkowski($fn=minkfn){
            polyhedron(points = vertices, faces=faces,  convexity = 20);
            sphere(minko);
        };
        sphere(ordi-roll,$fn=minkfn);
    }
    for(i=[0:len(faces)-1]) facetext(facecoord(i),labels[i],facerot[i],facetrans[i]);
}