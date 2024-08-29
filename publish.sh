#!/bin/bash

# 버전 번호 입력 받기
echo "Enter the new version number (e.g., 0.2.0):"
read VERSION

# setup.py 파일에서 버전 업데이트
sed -i '' "s/version=\".*\"/version=\"$VERSION\"/" setup.py

# 변경사항 커밋
git add setup.py
git commit -m "Bump version to $VERSION"

# 태그 생성
git tag v$VERSION

# 변경사항과 태그 푸시
git push origin main
git push origin v$VERSION

# 배포 파일 생성
python setup.py sdist bdist_wheel

# PyPI에 업로드
twine upload dist/*

echo "Version $VERSION has been published to PyPI"