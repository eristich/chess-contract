// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

contract Chess {

    address owner;
    enum PieceType {
        PAWN,
        ROOK,
        KNIGHT,
        BISHOP,
        KING,
        QUEEN
    }

    enum PieceColor {
        WHITE,
        BLACK
    }

    struct Piece {
        PieceColor color;
        PieceType kind;
        uint8 x;
        uint8 y;
    }

    struct Player {
        address addr;
        PieceColor color;
    }

    struct GameState {
        Player player1;
        Player player2;
        Piece[] pieceState;
    }

    GameState gstate;

    constructor(address _owner) {
        owner = _owner;
    }

    function getGameState() external pure returns(string[1][2] memory) {
        return [ ["what"], ["keuneni"] ];
    }

    function initGame() internal {
        gstate.player1 = Player(address(0), PieceColor.WHITE);
        gstate.player1 = Player(address(0), PieceColor.BLACK);

        for (uint8 i = 1; i < 9; i++) {
            gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.PAWN, i, 2));
            gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.PAWN, i, 7));
        }

        // ROOKS INIT
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.ROOK, 1, 1));
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.ROOK, 8, 1));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.ROOK, 8, 8));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.ROOK, 1, 8));

        // KNIGHTS INIT 
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.KNIGHT, 2, 1));
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.KNIGHT, 7, 1));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.KNIGHT, 2, 8));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.KNIGHT, 7, 8));
        
        // BISHOPS INIT
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.BISHOP, 3, 1));
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.BISHOP, 6, 1));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.BISHOP, 3, 8));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.BISHOP, 6, 8));

        // KINGS INIT
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.KING, 4, 1));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.KING, 5, 8));

        // QUEENS INIT
        gstate.pieceState.push(Piece(PieceColor.WHITE, PieceType.QUEEN, 5, 1));
        gstate.pieceState.push(Piece(PieceColor.BLACK, PieceType.QUEEN, 4, 8));
    }
}
