<?php

namespace App\Models;

use CodeIgniter\Model;

class ItemModel extends Model
{
    protected $table = 'item';
    protected $primaryKey = 'idItem';
    protected $allowedFields = ['idItem',
        'nome',
        'descricao',
        'preco',
        'forca',
        'agilidade',
        'inteligencia',
        'vida',
        'mana',
        'dano',
        'armadura',
        'velocidadeDeAtq',
        'habilidadeAtiva',
        'descricaoAtiva',
        'habilidadePassiva',
        'descricaoPassiva'];
    protected $returnType = 'object';
}

