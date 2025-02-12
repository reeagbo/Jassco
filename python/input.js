
const eS = 0x00;                                                         // Empty square
const wP = 0x05;                                                         // White pawn
const wN = 0x11;                                                         // White knight
const wB = 0x19;                                                         // White bishop
const wR = 0x29;                                                         // White rook
const wQ = 0x39;                                                         // White queen
const wK = 0x41;                                                         // White king
const bP = 0x07;                                                         // Black pawn
const bN = 0x13;                                                         // Black knight
const bB = 0x1B;                                                         // Black bishop
const bR = 0x2B;                                                         // Black rook
const bQ = 0x3B;                                                         // Black queen
const bK = 0x43;                                                         // Black king

// value to ascii
let pieces = {                                                           // Piece chars
  0x00: 0x20,                                                        	 // Empty square
  0x07: 0x70,                                                             // Black pawn
  0x13: 0x6e,                                                             // Black knight
  0x1B: 0x62,                                                             // Black bishop
  0x2B: 0x72,                                                             // Black rook
  0x3B: 0x71,                                                             // Black queen
  0x43: 0x6b,                                                             // Black king
  0x05: 0x50,                                                             // White pawn
  0x11: 0x4e,                                                             // White knight
  0x19: 0x42,                                                             // White bishop
  0x29: 0x52,                                                             // White rook
  0x39: 0x51,                                                             // White queen
  0x41: 0x4b                                                              // White king
};

var board = [                                                            // Chess board representation
  bR, bN, bB, bQ, bK, bB, bN, bR,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank8 + dummy squares
  bP, bP, bP, bP, bP, bP, bP, bP,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank7 + dummy squares
  eS, eS, eS, eS, eS, eS, eS, eS,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank6 + dummy squares
  eS, eS, eS, eS, eS, eS, eS, eS,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank5 + dummy squares
  eS, eS, eS, eS, eS, eS, eS, eS,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank4 + dummy squares
  eS, eS, eS, eS, eS, eS, eS, eS,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank3 + dummy squares
  wP, wP, wP, wP, wP, wP, wP, wP,  0, 0, 0, 0, 0, 0, 0, 0,               // Rank2 + dummy squares
  wR, wN, wB, wQ, wK, wB, wN, wR,  0, 0, 0, 0, 0, 0, 0, 0                // Rank1 + dummy squares
];

var vector_pointers = {                                                  // Move vector table pointers
  0x87: 0xFA,                                                            // Pawn moves address
  0x93: 0xF4,                                                            // Knight moves address
  0x9B: 0xFB,                                                            // Bishop moves address
  0xAB: 0xF1,                                                            // Rook moves address
  0xBB: 0xF9,                                                            // Queen moves address
  0xC3: 0xF9                                                             // King Moves address
};

let best_move = Array (2);                                               // Best move found by computer
let best_score = 0;


var user_move_length=0
var user_move=Array(4)
var source_sq=0
var target_sq=0
var keyd=0


function parseSquare () {}

function userInput(key) {
  user_move[user_move_length]=key
  user_move_length++
  if (user_move_length == 4) {                                      
    source_sq = parseSquare(user_move[0]+user_move[1]);         
    target_sq = parseSquare(user_move[2]+user_move[3]);         
    if (board[target_sq] == bK) {                                   
      //console.log("Black is checkmated!");                          
      document.removeEventListener("keydown", userInput);           
      return;                                                       
    }
	}
  } 
  
  document.addEventListener("keydown", userInput);
