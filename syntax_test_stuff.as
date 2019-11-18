// SYNTAX TEST "Packages/Crackshell/AngelScript.sublime-syntax"

#author "Openplanet"
// <- meta.preprocessor keyword.control.import
//       ^^^^^^^^^^ string.quoted.double

#if SOMETHING
// <- meta.preprocessor keyword.control.import
#endif
// <- meta.preprocessor keyword.control.import

%if SOMETHING_ELSE
// <- meta.preprocessor keyword.control.import
%endif
// <- meta.preprocessor keyword.control.import

#if true || false
//  ^^^^ constant.language
//       ^^ keyword.operator.logical
//          ^^^^^ constant.language

// <- source.as
#endif

void func2(const string &in str, SValue& sval) {}
// <- storage.type
//   ^^^^^ entity.name.function
//         ^^^^^ storage.modifier
//               ^^^^^^ storage.type
//                      ^^^ keyword.other
//                          ^^^ variable.parameter
//                             ^ punctuation.separator
//                               ^^^^^^ storage.type
//                                     ^ keyword.other
//                                       ^^^^ variable.parameter

interface IThing
// <- meta.interface storage.type.interface
//        ^^^^^^ entity.name.interface
{
// <- punctuation.section.block.begin
  void func();
  // <- storage.type
  //   ^^^^ entity.name.function
  //         ^ punctuation.terminator
}
// <- punctuation.section.block.end

enum MyEnum
// <- storage.type.enum
//   ^^^^^^ entity.name.enum
{
// <- punctuation.section.block.begin
  a,
// ^ punctuation.separator
  b,
// ^ punctuation.separator
  c = 3,
  //^ keyword.operator.assignment
  //  ^ constant.numeric
  //   ^ punctuation.separator
  d = 4,
  e = 5,
  f = 6
  //^ keyword.operator.assignment
  //  ^ constant.numeric
}
// <- punctuation.section.block.end

enum MyEnum2 { a, b, c, d }

string g_string = "this is a\ntest";
// <- storage.type
//     ^^^^^^^^ variable.other
//              ^ keyword.operator.assignment
//                ^ punctuation.definition.string.begin
//                ^^^^^^^^^^^^^^^^^ meta.string
//                 ^^^^^^^^^^^^^^^ string.quoted.double
//                          ^^ constant.character.escape
//                                ^ punctuation.definition.string.end
//                                 ^ punctuation.terminator

uint g_bw = 1 | 2 | 3 & 4 & ~0xFF << 1 >> 2;
// <- storage.type
//   ^^^^ variable.other
//          ^ constant.numeric
//            ^ keyword.operator.bitwise
//                ^ keyword.operator.bitwise
//                    ^ keyword.operator.bitwise
//                        ^ keyword.operator.bitwise
//                          ^ keyword.operator.bitwise
//                                ^^ keyword.operator.bitwise
//                                     ^^ keyword.operator.bitwise
//                                         ^ punctuation.terminator

void bitstuff()
{
  @(this.unit) = unit;
  // <- keyword.other
// ^ punctuation.section.parens.begin
  //    ^ punctuation.accessor
  //         ^ punctuation.section.parens.end
  //           ^ keyword.operator.assignment
  //             ^^^^ variable.other
  //                 ^ punctuation.terminator
  this.x = 1;
  // <- variable.language

  for (uint i = 0; i < m_skills.length(); i++)
    stuff();
    // <- entity.name.function
    //   ^ meta.function-call
    //     ^ punctuation.terminator

  uint x = 0;
  x >>= 2;
  // <- variable.other
  //^^^ keyword.operator.assignment
  //    ^ constant.numeric
  //     ^ punctuation.terminator

  x |= 2;
  // <- variable.other
  //^^ keyword.operator.assignment

  if (x != 2) {}
  // <- keyword.control
  // ^ punctuation.section.parens.begin
  //  ^ variable.other
  //    ^^ keyword.operator.logical
  //       ^ constant.numeric
  //        ^ punctuation.section.parens.end

  bool b = (x != 2);
  // <- storage.type
  //   ^ variable.other
  //        ^ variable.other
  //          ^^ keyword.operator.logical
  //             ^ constant.numeric
  //               ^ punctuation.terminator

  if (b) { return false; }
  // <- keyword.control
  //  ^ variable.other
  //       ^^^^^^ keyword.control
  //              ^^^^^ constant.language
  //                   ^ punctuation.terminator
  //                     ^ punctuation.section.block.end

  try {
  // <- keyword.control
  //  ^ punctuation.section.block.begin
    int x = 10;
  } catch {
  // <- punctuation.section.block.end
  //^^^^^ keyword.control
  //      ^ punctuation.section.block.begin
    print("stuff");
    // <- meta.function-call support.function
    //    ^^^^^^^ meta.string
  }
  // <- punctuation.section.block.end

  switch (x) {
  // <- keyword.control
  //      ^ variable.other
  //         ^ punctuation.section.block.begin
  case 1:
  // <- keyword.control
  //   ^ constant.numeric
  //    ^ punctuation
    break;
    // <- keyword.control
    //   ^ punctuation.terminator
  }
  // <- punctuation.section.block.end

  int x = SomeNamespace::SomeFunction();
  // <- storage.type
  //  ^ variable.other
  //    ^ keyword.operator.assignment
  //      ^^^^^^^^^^^^^ entity.name.namespace
  //                   ^^ punctuation.separator
  //                     ^^^^^^^^^^^^ entity.name.function
  //                                 ^ meta.function-call punctuation
  //                                  ^ punctuation
  //                                   ^ punctuation.terminator

  auto x = cast<SomeClass>(obj);
  // <- storage.type
  //   ^ variable.other
  //     ^ keyword.operator.assignment
  //       ^^^^ keyword.other
  //           ^ punctuation.definition.generic.begin
  //            ^^^^^^^^^ storage.type
  //                     ^ punctuation.definition.generic.end
  //                       ^^^ variable.other
  //                           ^ punctuation.terminator

  int x = int(someFloat);
  // <- storage.type
  //  ^ variable.other
  //    ^ keyword.operator.assignment
  //      ^^^ storage.type
  //          ^^^^^^^^^ variable.other

  obj.stuff = true;
  // <- variable.other
  // ^ punctuation.accessor
  //  ^^^^^ variable.other
  //        ^ keyword.operator.assignment
  //          ^^^^ constant.language
  //              ^ punctuation.terminator

  obj.obj.stuff();
  // <- variable.other
  // ^ punctuation.accessor
  //  ^^^ variable.other
  //     ^ punctuation.accessor
  //      ^^^^^ entity.name.function
  //             ^ punctuation.terminator

  if (true) {
  } else {
  // <- punctuation.section.block.end
  //^^^^ keyword.control
  //     ^ punctuation.section.block.begin

    // <- meta.codescope
  }
  // <- punctuation.section.block.end

  if (!value)
  // <- keyword.control
  //  ^ keyword.operator.logical
  //   ^^^^^ variable.other
    g_flags.Delete(flag);
    // <- variable.other
    //     ^ punctuation.accessor
    //      ^^^^^^ entity.name.function
    //            ^ punctuation
    //             ^^^^ variable.other
    //                  ^ punctuation.terminator
  else if (true)
  // <- keyword.control
  //   ^^ keyword.control
  //       ^^^^ constant.language
    func();
  else
  // <- keyword.control
    g_flags.Set(flag, persistent ? FlagState::Run : FlagState::Level);
    // <- variable.other
    //     ^ punctuation.accessor
    //      ^^^ entity.name.function

  if (true)
    ;
  else
    g_flags.Set();
    // <- variable.other
    //     ^ punctuation.accessor
    //      ^^^ entity.name.function

  cast<Campaign>(g_gameMode).m_townLocal.m_gold += amount;
  // <- keyword.other
  //   ^^^^^^^^ storage.type
  //             ^^^^^^^^^^ variable.other
  //                        ^ punctuation.accessor
  //                                    ^ punctuation.accessor
  //                                            ^^ keyword.operator.assignment
  //                                               ^^^^^^ variable.other
  //                                                     ^ punctuation.terminator

  for (;;) { a(); }
  // <- keyword.control
  //  ^ punctuation.section.parens.begin
  //   ^ punctuation.terminator
  //    ^ punctuation.terminator
  //     ^ punctuation.section.parens.end
  //       ^ punctuation.section.block.begin
  //         ^ entity.name.function
  //              ^ punctuation.section.block.end

  for (uint i = 0; i < list.m_modifiers.length(); i++) { a(); }
  // <- keyword.control
  //   ^^^^ storage.type
  //        ^ variable.other
  //          ^ keyword.operator.assignment
  //             ^ punctuation.terminator
  //               ^ variable.other
  //                 ^ keyword.operator.logical
  //                   ^^^^ variable.other
  //                       ^ punctuation.accessor
  //                        ^^^^^^^^^^^ variable.other.member
  //                                   ^ punctuation.accessor
  //                                    ^^^^^^ support.function
  //                                          ^ punctuation
  //                                            ^ punctuation.terminator
  //                                              ^ variable.other
  //                                               ^^ keyword.operator.assignment
  //                                                 ^ punctuation.section.parens.end

  auto mod = list.m_modifiers[i];
  // <- storage.type
  //   ^^^ variable.other
  //       ^ keyword.operator.assignment
  //         ^^^^ variable.other
  //             ^ punctuation.accessor
  //              ^^^^^^^^^^^ variable.other.member
  //                         ^ punctuation.section.brackets.begin
  //                          ^ variable.other
  //                           ^ punctuation.section.brackets.end
  //                            ^ punctuation.terminator
  auto modList = cast<Modifiers::ModifierList>(mod);
  //                  ^^^^^^^^^ entity.name.namespace
  //                           ^^ punctuation.separator
  //                             ^^^^^^^^^^^^ storage.type
  if (modList !is null) {}
  // <- keyword.control
  //          ^ keyword.operator.logical
  //           ^^ keyword.operator.word
  //              ^^^^ constant.language

  Foo x(123);
  // <- storage.type
  //  ^ variable.other
  //    ^^^ constant.numeric
  //        ^ punctuation.terminator

  Stats::Stat@ stat;
  // <- entity.name.namespace
  //   ^^ punctuation.separator
  //     ^^^^ storage.type
  //         ^ keyword.other
  //           ^^^^ variable.other
  //               ^ punctuation.terminator
  Stats::Add();
  // <- entity.name.namespace
  //   ^^ punctuation.separator
  //     ^^^ entity.name.function
  //        ^ meta.function-call

  this.x = true;
  // <- variable.language
  //  ^ punctuation.accessor
  //     ^ keyword.operator.assignment

  pass(@this);
  // <- entity.name.function
  //  ^ punctuation.section.parens.begin
  //   ^ keyword.other
  //    ^^^^ variable.language
  //        ^ punctuation.section.parens.end
  //         ^ punctuation.terminator
  pass(this);
  // <- entity.name.function
  //  ^ punctuation.section.parens.begin
  //   ^^^^ variable.language
  //       ^ punctuation.section.parens.end
  //        ^ punctuation.terminator

  array<int> arr;
  // <- storage.type
  //    ^^^ storage.type
  //         ^^^ variable.other

  @m_title = null;
  // <- keyword.other
  //^^^^^^ variable.other.member
  //       ^ keyword.operator.assignment
  //         ^^^^ constant.language
  //             ^ punctuation.terminator

  m_skills[i].OnCollide(unit, pos, normal, fxOther);
  // <- variable.other.member
  //      ^ punctuation.section.brackets.begin
  //       ^ variable.other
  //        ^ punctuation.section.brackets.end
  //         ^ punctuation.accessor
  //          ^^^^^^^^^ entity.name.function
  //                   ^ punctuation.section.parens.begin
  //                    ^^^^ variable.other
  //                        ^ punctuation.separator
  //                             ^ punctuation.separator
  //                                     ^ punctuation.separator
  //                                              ^ punctuation.section.parens.end
  //                                               ^ punctuation.terminator

  (Network::Message("PlayerCombo") << true << m_comboTime << m_comboCount).SendToAll();
  // <- punctuation.section.parens.begin
  //                                                                     ^ punctuation.section.parens.end
  //                                                                      ^ punctuation.accessor
  //                                                                       ^ entity.name.function

  return;
  // <- keyword.control
  //    ^ punctuation.terminator
}
// <- source.as meta.function punctuation.section.block.end

bool g_b = true;
// <- storage.type
//       ^ keyword.operator.assignment
//         ^^^^ constant.language

bool g_b2 = (true || false && true) == true;
//           ^^^^ constant.language
//                ^^ keyword.operator.logical
//                   ^^^^^ constant.language
//                         ^^ keyword.operator.logical
//                            ^^^^ constant.language
//                                  ^^ keyword.operator.logical
//                                     ^^^^ constant.language
//                                         ^ punctuation.terminator

ffaaa g_fff = 123;
// <- storage.type
//    ^^^^^ variable.other
//          ^ keyword.operator.assignment
//            ^^^ constant.numeric
//               ^ punctuation.terminator

int g_test1;
// <- storage.type
//  ^^^^^^^ variable.other
//         ^ punctuation.terminator

int g_test12 = 12;
// <- storage.type

array<int> g_test2 = 12;
// <- storage.type
//   ^ punctuation
//    ^^^ storage.type
//       ^ punctuation
//         ^^^^^^^ variable.other
//                 ^ keyword.operator.assignment
//                   ^^ constant.numeric
//                     ^ punctuation.terminator

array<array<int>> g_test3;
// <- storage.type
//   ^ punctuation
//    ^^^^^ storage.type
//         ^ punctuation
//          ^^^ storage.type
//             ^^ punctuation
//                ^^^^^^^ variable.other

array<array<int>@>@ g_foo;
// <- storage.type
//    ^^^^^ storage.type
//          ^^^ storage.type
//              ^ keyword.other
//                ^ keyword.other
//                  ^^^^^ variable.other

int func0();
// <- storage.type
//  ^^^^^ entity.name.function
//       ^^ punctuation
//         ^ punctuation.terminator

int func1()
// <- storage.type
//  ^^^^^ entity.name.function
{
// <- punctuation
  // <- meta.function
  int a;
  // <- storage.type
  //  ^ variable.other
  //   ^ punctuation.terminator
  {
    // <- meta.codescope
  }
  int a = 10;
  // <- storage.type
  //  ^ variable.other
  //    ^ keyword.operator.assignment
  //        ^ punctuation.terminator
  a += 10;
  // <- variable.other
  //^^ keyword.operator.assignment
  //   ^^ constant.numeric
  //     ^ punctuation.terminator
  a *= 20;
  // <- variable.other
  //^^ keyword.operator.assignment
  //   ^^ constant.numeric
  //     ^ punctuation.terminator
  a = 20 * a;
  // <- variable.other
  //^ keyword.operator.assignment
  //  ^^ constant.numeric
  //     ^ keyword.operator.arithmetic
  //       ^ variable.other
  //        ^ punctuation.terminator
  a = (20 * a);
  //  ^ punctuation
  //      ^ keyword.operator.arithmetic
  //         ^^ punctuation
  a = func2(10, 20, 30);
  // <- variable.other
  //  ^^^^^ entity.name.function
  //       ^ punctuation
  //        ^^ meta.expression constant.numeric
  //          ^ punctuation.separator
  //            ^^ constant.numeric
  //              ^ punctuation.separator
  //                ^^ constant.numeric
  //                  ^ punctuation
  //                   ^ punctuation.terminator
  a = func2(func2(10, 20, 30), a * 20, 20);
  //       ^ meta.function-call
  //             ^ meta.function-call
  //                ^ punctuation.separator
  //                    ^ punctuation.separator
  //                         ^ punctuation.separator
  //                           ^ variable.other
  //                             ^ keyword.operator.arithmetic
  //                               ^^ constant.numeric
  //                                 ^ punctuation.separator
  //                                      ^ punctuation.terminator
  func3();
  // <- entity.name.function
  //   ^ meta.function-call punctuation.section.parens.begin
  //    ^ punctuation.section.parens.end
  //     ^ punctuation.terminator
  a = func3();
  // <- variable.other
  //  ^ meta.expression entity.name.function
  //       ^ meta.expression meta.function-call punctuation.section.parens.begin
  //        ^ meta.expression punctuation.section.parens.end
  //         ^ punctuation.terminator
}
// <- punctuation

int func2(int x, int y);
// <- storage.type
//  ^^^^^ entity.name.function
//       ^ meta.function.parameters punctuation
//        ^^^ storage.type
//            ^ variable.parameter
//             ^ punctuation.separator
//               ^^^ storage.type
//                   ^ variable.parameter
//                    ^ punctuation
//                     ^ punctuation.terminator

void func2(int x = 10, int y = 20);
// <- storage.type
//   ^^^^^ entity.name.function
//             ^ variable.parameter
//               ^ keyword.operator.assignment
//                 ^^ constant.numeric
//                   ^ punctuation.separator
//                         ^ variable.parameter
//                             ^^ constant.numeric
//                                ^ punctuation.terminator

int func2(
// <- storage.type
//  ^^^^^ entity.name.function
//       ^ meta.function.parameters
  int x, // x
  // <- storage.type
  //  ^ variable.parameter
  //   ^ punctuation.separator
  int y = 20, // y
  // <- storage.type
  //  ^ variable.parameter
  //    ^ keyword.operator.assignment
  //      ^^ constant.numeric
  //        ^ punctuation.separator
  int z = 1 // z
  // <- storage.type
  //  ^ variable.parameter
  //    ^ keyword.operator.assignment
  //      ^ constant.numeric
  //        ^^^^ comment
)
// <- punctuation
{
  x = y = z;
  // <- variable.other
  //^ keyword.operator.assignment
  //  ^ variable.other
  //    ^ keyword.operator.assignment
  //      ^ variable.other
  //       ^ punctuation.terminator
}

array<int>
// <- storage.type
func2() {}
// <- entity.name.function
//      ^^ meta.function punctuation

array<array<int>> func3() {}

array<Foo@> func4() {}
namespace Xxx
{
  array<array<Foo@>@> func5() {}
}
array<array<Foo@>@>@ func6() {}
// <- storage.type
//    ^^^^^ storage.type
//          ^^^ storage.type
//             ^ keyword.other
//               ^ keyword.other
//                 ^ keyword.other
//                   ^^^^^ entity.name.function
//                        ^^ meta.function.parameters punctuation
//                           ^^ meta.function punctuation

// comment line
// <- comment.line
// ^^^^^^^^^^^^ comment.line

/* comment block */
// <- comment.block punctuation.definition.comment
// ^^^^^^^^^^^^^ comment.block
//               ^^ comment.block punctuation.definition.comment

/**/
// <- comment.block punctuation.definition.comment

/**
// <- comment.block.documentation punctuation.definition.comment
 * Documentation
 */

/// Documentation
// <- comment.block.documentation punctuation.definition.comment
//  ^^^^^^^^^^^^^ comment.block.documentation

namespace Foo
// <- storage.type.namespace
//        ^^^ entity.name.namespace
{
  namespace FooInner
  // <- storage.type.namespace
  //        ^^^^^^^^ entity.name.namespace
  {
  // <- punctuation.section.block.begin
  }
  // <- punctuation.section.block.end

  int g_test;
  // <- storage.type
  //  ^^^^^^ variable.other
  //        ^ punctuation.terminator

  namespace Aaaa
  {
    int g_test;
    // <- storage.type
    //  ^^^^^^ variable.other
    //        ^ punctuation.terminator
  }

  class Bar : Foobar
  // <- storage.type.class
  //    ^^^ entity.name.class
  //        ^ punctuation.separator
  //          ^^^^^^ entity.other.inherited-class
  {
    int m_test;
    // <- storage.type
    //  ^^^^^^ variable.other.member
    //        ^ punctuation.terminator
    private int m_test2;
    // <- storage.modifier
    //      ^^^ storage.type
    //          ^^^^^^^ variable.other.member
    intptr m_ptr;
    // <- storage.type
    //     ^^^^^ variable.other.member
    //          ^ punctuation.terminator

    Bar(int x)
    // <- entity.name.function.constructor
    // ^ meta.function.parameters punctuation
    //  ^^^ storage.type
    //      ^ variable.parameter
    //       ^ punctuation
    {
      // <- meta.function
      super();
      // <- variable.language
      //   ^^ punctuation
      //     ^ punctuation.terminator

      m_test = 10;
      // <- variable.other.member
      //     ^ keyword.operator.assignment
      //       ^^ constant.numeric
      //         ^ punctuation.terminator
    }

    int MemberFunc()
    {
    // <- punctuation.section.block.begin
      return m_test;
      // <- keyword.control
      //     ^^^^^^ variable.other.member
      //           ^ punctuation.terminator
    }
    // <- punctuation.section.block.end

    void Thing()
    {
    // <- punctuation.section.block.begin
      m_test = MemberFunc();
    }
    // <- punctuation.section.block.end
  }
  // <- punctuation.section.block.end
}
// <- punctuation.section.block.end

class Foobar
// <- storage.type.class
//    ^^^^^^ entity.name.class
{
// <- punctuation.section.block.begin
}
// <- punctuation.section.block.end

float getPi() { return PI; }
//                     ^^ entity.name.constant
float getP() { return P; }
//                    ^ variable.other

int getNum10() { return 10; }
// <- storage.type
//  ^^^^^^^^ entity.name.function
//          ^^ meta.function meta.function.parameters punctuation
//             ^ punctuation.section.block.begin
//               ^^^^^^ keyword.control
//                      ^^ constant.numeric
//                        ^ punctuation.terminator
//                          ^ punctuation.section.block.end

array<array<Foo@>@>@ test()
{
  auto ret = { 1, 2, 3 };
  // <- storage.type
  //   ^^^ variable.other
  //         ^ punctuation.section.braces.begin
  //            ^ punctuation.separator
  //                   ^ punctuation.section.braces.end
  //                    ^ punctuation.terminator
  return { ret };
  // <- keyword.control
  //     ^ punctuation.section.braces.begin
  //       ^^^ variable.other
  //           ^ punctuation.section.braces.end
  //            ^ punctuation.terminator
}
// <- source.as meta.function punctuation.section.block.end
}
// <- invalid
