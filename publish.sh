#!/bin/bash

# 현재 버전 추출
CURRENT_VERSION=$(sed -n "s/.*version=\"\(.*\)\".*/\1/p" setup.py)
echo "Current version: $CURRENT_VERSION"

# 새 버전 번호 입력 받기
echo "Enter the new version number (e.g., 0.1.1):"
read NEW_VERSION

# setup.py 파일에서 버전 업데이트
sed -i '' "s/version=\"$CURRENT_VERSION\"/version=\"$NEW_VERSION\"/" setup.py

# 변경사항 커밋
git add setup.py
git commit -m "Bump version to $NEW_VERSION"

# 태그 생성
git tag v$NEW_VERSION

# 변경사항과 태그 푸시
git push origin main
git push origin v$NEW_VERSION

# 이전 배포 파일 삭제
rm -rf dist/*

# 배포 파일 생성
python setup.py sdist bdist_wheel

# PyPI에 업로드
twine upload dist/*

echo "Version $NEW_VERSION has been published to PyPI"