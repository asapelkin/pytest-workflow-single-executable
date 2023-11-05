import sys
import pytest
from pytest_workflow import plugin as workflow_plugin

def main():
    pytest.main(args=sys.argv[1:], plugins=[workflow_plugin])

if __name__ == "__main__":
    main()