module visual_d_test;

import std.stdio; // : writeln, writefln, File;
import std.string;
import std.range; // : iota;
import std.conv : to;
import std.random : uniform;
import std.algorithm.iteration : uniq, map, splitter, joiner, filter;
import std.algorithm.sorting : sort;
import std.algorithm.mutation : reverse, swap, fill;

import std.parallelism;
import core.thread;
import core.time;

//void printInParens(T)(T value) {
//    writefln("(%s)", value);
//}

struct myStr
{
    string toString() const
    {
        return to!string(x);
    }

    float x;
}

void console_write(T...)(T value, T2 value2)
{
    writeln(value);
    writeln(value2);
}

auto returnSomething(int val)
{
    if (val == 0)
    {
        return 0;
    } // return int
    else
    {
        return 1.02; // return double
    }
}

void grandParentFunc()
{
    int a = 4;
    void parentFunc()
    {
        void childFunc()
        {
            writeln(a);
        }

        childFunc();
    }

    parentFunc();

}

void loopBreak()
{
    outer: for (int i = 0; i < 10; ++i)
    {
        for (int j = 0; j < 5; ++j)
        {
            //...
            write('(', j, ' ', 5, "),");

            if (j == 4 && i == 5)
            {
                break outer; // break out of parent loop "outer"
            }
        }
        writeln();
    }
}

extern (C++) int c_function(int i, int j, int k);

// use containers in a FUNCTIONAL style of
// programming, kinda like javascript
void getVocab(string file_name)
{

    File(file_name, "r").byLineCopy() // returns an objects that can read a file line by line
    // a map where each line shall be automatically broken into words
    // NOTE: the lines in memory are not broken up, we just copy
    // words from the line and store it into the map.
    .map!(line => line.splitter(" ")) // joiner puts all elements in container/map together
    // into a SINGLE object. Ex: multiple strings combined into one.
    .joiner( /*Whatever you put in here will be BETWEEN each element*/ ) // create map of words from joined string above.
    // "strip" removes any whitespace it sees before or after the word.
    // then we insert word into map.
    .map!(word => word.strip()) // remove empty words from map
    .filter!(word => !word.empty()) // turn map into array
        .array() // sort array
        .sort() // create separate, unique array
        .uniq() // find # of unique words
        .count() // print number
        .writeln();
}

void mapUsingMultipleFunctions()
{
    auto sums = [2, 4, 6, 8];
    auto products = [1, 4, 9, 16];

    size_t i = 0;
    foreach (result; [1, 2, 3, 4].map!("a + a", "a * a"))
    {
        writeln(result[0]); // sums[i]
        writeln(result[1]); // products[i]
        ++i;
    }
}

void infiniteRange()
{
    42.repeat.take(5).writeln();
}

void rangeRefAndSaving()
{
    // by value (Structs)
    auto r = 5.iota;
    auto r2 = refRange(&r);
    r2.save.drop(5).writeln; // []
    r2.writeln; // [0, 1, 2, 3, 4]
}

// ????
void moving()
{
    auto a = [3, 4, 5];
    writeln(moveFront(a)); // 
    writeln(a.length); // 3
    writeln(a.front());
}

T findEqualPair(T)(T r)
{
    if (!r.empty())
    {
        auto s = r.save();
        s.popFront();
        // notice how pop front does not actually delete
        // any elements in memory, nor does it modify the
        // containers. It just goes to the next element.
        for (; !s.empty(); r.popFront(), s.popFront())
        {
            if (r.front() == s.front())
            {
                break;
            }
        }
    }
    return r;
}

R efficientReverse(R)(R r)
{
    // while there are at least 2 elements to swap
    while(r.length> 1)
    {
        swap(r.front(),r.back());
        r.popFront();
        r.popBack();
    }

    return r;
}

void slicing()
{
    int[] a;
    a = new int[5]; // defaulted to 0
    fill(a,iota(0,5));
    int [] b = a[0..$-1]; // notice b does not use "new"
    a.writeln;
    b.writeln;
}

void inKeyword()
{
    auto r = iota(0,10,1);
    assert(3 in r);
    r.writeln();
}

void zipAndLockstepUsage()
{
    auto a = assocArray(zip([0, 1, 2], ["a", "b", "c"])); // aka zipMap
    static assert(is(typeof(a) == string[int]));
    writeln(a); // [0:"a", 1:"b", 2:"c"]

    auto arr1 = [1,2,3,4,5,100];
    auto arr2 = [6,7,8,9,10];

    foreach (ref a, b; lockstep(arr1, arr2))
    {
        a += b;
    }

    writeln(arr1); // [7, 9, 11, 13, 15, 100]

    /// Lockstep also supports iterating with an index variable:
    foreach (index, a, b; lockstep(arr1, arr2))
    {
        writeln(arr1[index]); // a
        writeln(arr2[index]); // b
    }
}

// writeln(x++) is not actually called
// when passed into "lazyParameter" function but
// instead waits to be called in the "times" function.
void lazyParameter()
{

    auto times = (int n, lazy void exp)
    {
        while (n--)
        {
            exp();
        }
    };
    int x;

    times(3, writeln(x++));

}

void parrallelismAndTimers()
{
    struct Student {
        int number;

        void aSlowOperation() {
            writefln("The work on student %s has begun", number);

            // Wait for a while to simulate a long-lasting operation
            Thread.sleep(1.seconds);

            writefln("The work on student %s has ended", number);
        }
    }

        writefln("There are %s cores on this system.", totalCPUs);

        auto students =
        [ Student(1), Student(2), Student(3), Student(4) ];

        MonoTime before = MonoTime.currTime;

        // NOTE: parallel makes all student
        // objects parallel and is key for
        // multithreading.
        foreach (student; parallel(students))
        {
            student.aSlowOperation();
        }

        MonoTime after = MonoTime.currTime;
        Duration l_dur = after - before;
        l_dur.split.seconds.writeln;



        auto d = dur!"days"(12) + dur!"minutes"(7) + dur!"usecs"(501223);
        long days;
        int seconds;
        short msecs;
        d.split!("days", "seconds", "msecs")(days, seconds, msecs);
        assert(days == 12);
        assert(seconds == 7 * 60);
        assert(msecs == 501);

        d = dur!"days"(12);
        assert(d.split!"weeks"().weeks == 1);
        assert(d.split!"days"().days == 12);

        assert(d.split().weeks == 1);
        assert(d.split().days == 5);

}

void main()
{
    //int[] test_array = [1,2,3,4];
    //test_array.reverse;
    //test_array.writeln;

    //writeln(4,myStr(5));
    //writeln(returnSomething(uniform(0,2)));
    //grandParentFunc();
    //loopBreak();
    //c_function(1,2,3);
    //getVocab("random_words.txt");
    //infiniteRange();
    //rangeRefAndSaving();
    //moving(); ???
    //findEqualPair(test_array).writeln();

    //efficientReverse(test_array).writeln;


    //slicing();
    parrallelismAndTimers();


    while (true)
    {
    }

}
