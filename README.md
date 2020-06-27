# List::More::MoreUtils

Additional list functions.

## Dependencies

- [`Contextual::Return`](https://metacpan.org/pod/Contextual::Return)

## Instalation

No special requirements, install like other Perl modules:

```
$ perl Makefile.pm
$ make
$ make test
# make install
```

## Functions

### `choice({ list_ref => $list_ref, n => $number_of_random_choices })`

Returns random choice(s) from the given list reference.

Parameter `n` is optional, if not given, one random scalar choice will be returned.
If `n` is given, a list of random choices will be returned.

Inspired by Python's [`random.choice()`](https://docs.python.org/3/library/random.html#random.choice) method.

### `largest_range(@list)`

Returns a largest range of int numbers.

E.g. for a list containing `(1, 3, 2, 8, 10, 9, 11)`, `(8, 11)` will be returned.

Uses [`Contextual::Return`](https://metacpan.org/pod/Contextual::Return) so the function could be used in various contexts:

- list
- scalar: returns the difference between upper range number and lower range number, e.g. it returns 3 for the above-mentioned example
- arrayref
- hashref: returns a hashref like so: `{ min => <lower range num>, max => <upper range num> }`

### `mirrored(@list)`

Returns `1` if the given list is mirrored, `0` if not.

E.g. it returns `1` for the following list: `(1, 2, 3, 2, 1)`,
and it returns `0` for the following list: `(-1, 0, 5, 5, 120, -1)`

## Usage

The module uses [`Exporter`](https://metacpan.org/pod/Exporter) module.

It doesn't import any functions by default (`@EXPORT` is empty).

You can import one of the above-mentioned functions, or use export tags:

- `all | ALL`: imports all functions
- `test | TEST`: imports all functions
