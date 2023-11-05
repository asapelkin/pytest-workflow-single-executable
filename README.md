Pytest with [pytest-workflow](https://github.com/LUMC/pytest-workflow) plugin, compiled with Nuitka into a single binary. It is possible, so it should be done.

![Because...](resources/image.png)

## Preparation - install tox
To run this project you need [tox](https://tox.wiki/en/latest/installation.html)


## Build

To build the executable, run the following command:
```bash
tox -e build
```

The resulting executable will be located at `./dist/pytest_plus_nuitka.nuitka`.

 It is a single executable file, however, keep in mind that it will implicitly perform some unpacking during execution because it is not fully statically linked and contains multiple shared libraries hidden inside the executable itself.


## Test
This executable embeds [pytest-workflow](https://github.com/LUMC/pytest-workflow) pytest plugin, which operates by recursively searching test*.yaml files in current directory and running them.
Two yaml tests samples can be found inside `test-resources`, execute the following command after building to run them:
```bash
tox -e test
```

## Run it yourself
Finally, you can run it yourself wherever you whant.
```
> ./dist/pytest_plus_nuitka.nuitka --rootdir test-resources
collecting ...
collected 7 items

simple echo:
        command:   echo moo
        directory: /tmp/pytest_workflow_zf8vqz7n/simple_echo
        stdout:    /tmp/pytest_workflow_zf8vqz7n/simple_echo/log.out
        stderr:    /tmp/pytest_workflow_zf8vqz7n/simple_echo/log.err
'simple echo' done.

regex tests:
        command:   echo Hello, world
        directory: /tmp/pytest_workflow_zf8vqz7n/regex_tests
        stdout:    /tmp/pytest_workflow_zf8vqz7n/regex_tests/log.out
        stderr:    /tmp/pytest_workflow_zf8vqz7n/regex_tests/log.err
'regex tests' done.

test-resources/test-echo.yaml ....
test-resources/test-regexp.yaml ...
```

## Portability
The resulting binary is generally portable in the sense that it is self-contained and does not have any dependencies.

That said, keep in mind that you should run this build in a special environment (against an older version of glibc) to make the resulting binary fully portable across different Linux distributions. A good idea would be to use [one of the manylinux containers](https://github.com/pypa/manylinux) as the build environment.
