<?php

use PHPUnit\Framework\TestCase;
use App\Utility\Hash;

class HashTest extends TestCase
{

    public function testGenerateProperSha256() {
        // string "test" en sha256
        $sha256_test = "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08";

        $result = Hash::generate("test");

        $this->assertEquals($sha256_test, $result);
    }   


    public function testGenerateEmptyInput() {
        $result = Hash::generate("");

        $this->assertEquals(null, $result);
    }
}