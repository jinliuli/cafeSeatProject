# cafeSeatProject

### git 저장소 연결하기


#### 1. 기존 폴더를 Git 저장소로 초기화 (이미 Git 저장소인 경우 생략)
- git init


#### 2. 원격 저장소 추가
- git remote add origin <원격 저장소 URL>


#### 3. 원격 저장소에서 최신 내용 가져오기
- git fetch origin


#### 4. 원격 저장소의 내용을 로컬 폴더에 덮어쓰기 (main 브랜치 사용시 예전에는 main 브랜치 이름으로 master를 사용했음)
- git reset --hard origin/main


#### 5. 현재 상태 확인
- git status


#### 6. 로그 확인
- git log --oneline


### 로컬 저장소에서 원격 저장소에 올리기
1. git fetch origin     -> 원격 저장소에 있는 최신 로그 정보를 가져온다.
2. git status           -> 원격 저장소에 가져온 최신 로그를 참조하여 로컬 저장소(현재 컴퓨터)와 원격 저장소(git hub)에 버전 차이를 비교한다.
3. git add              -> staging area에 변경된 파일 또는 새로 추적할 파일을 지정한다.
    - gid add . -> .gitignore에서 제외되지 않은 모든 나머지 폴더 스테이징 시
    - git add (file) -> 개별 파일만 올릴 시에는 git add <file>
    - git add * -> .gitignore에서 제외된 폴더 포함 모든 작업폴더 내용을 스테이징 시
    - git commit -a -> 변경사항(add)을 생략하고 바로 커밋할 시

4. git commit ->  작업폴더(워킹트리)의 내용을 로컬 저장소에 저장한다(커밋 메세지 포함)
    - git commit -m "메시지"

3. git pull(원격 저장소에 자신의 저장내용을 올리기 전에 원격저장소에 있는 내용을 받아옴)
4. git push(로컬저장소(자신의 컴퓨터)에 있는 내용을 저장함)


#### 1. 로컬  저장소의 내용을 추가 staging area에 올림
- git add .
- 이 때 git status로 본인이 올릴 파일 목록을 확인
- staging area에 올라간 목록을 초기화하고 싶다면 git reset


#### 2. 로컬 저장소에 저장할 소스를 진짜 저장한다
- git commit -m "원하는 메세지"
- 자신의 컴퓨터의 내용을 기록함


#### 3. 원격 저장소의 저장내용을 받아온다
- git pull
- conflict가 나면 해당 파일을 확인해서 꺽쇄안에 내용을 비교해서 저장하고 로컬 저장소에 저장


#### 4. 원격 저장소에 로컬 저장소의 내용을 저장한다
- git push

## Git 용어 정리
## 4개의 작업공간
### 워킹 트리(Working tree)
- 워킹트리, 워킹 디렉토리, 작업 디렉토리, 작업 폴더 모두 같은 의미공식문서에서는 커밋을 체크아웃하면 생성되는 파일과 디렉토리로 정의하며,정확하게는 작업 폴더에서 [.git]폴더인 로컬저장소를 뺀 나머지 부분


### 로컬저장소(Local repository)
- git init으로 생성되는 [.git] 폴더로 커밋, 스테이지가 이 폴더에 저장됨


### 원격저장소(remote repository)
- 로컬 저장소를 업로드 하는 곳이며, GitHub은 원격 저장소이다.


### Git 저장소
- Git 명령어로 관리할 수 있는 폴더 전체를 Git 프로젝트 또는 Git 저장소라고 부른다.엄밀하게는 로컬저장소를 의미하지만 넓은 의미로 워킹 트리를 의미하기도 함

git push -u origin main
git push --set-upstream origin main

### use this
https://velog.io/@aksen5240/Git-%EC%9D%B4%ED%95%B4%EC%9D%98-%ED%95%B5%EC%8B%AC-%EC%9E%91%EC%97%85-%EC%98%81%EC%97%AD%EA%B3%BC-%ED%8C%8C%EC%9D%BC-%EC%83%81%ED%83%9C

https://sunrise-min.tistory.com/entry/Git#Git%EC%97%90%EC%84%9C_%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94_%ED%8C%8C%EC%9D%BC%EC%9D%98_%EC%83%81%ED%83%9C_4%EA%B0%80%EC%A7%80

### check the following website:
### https://sunrise-min.tistory.com/entry/Git#Git%EC%97%90%EC%84%9C_%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94_%ED%8C%8C%EC%9D%BC%EC%9D%98_%EC%83%81%ED%83%9C_4%EA%B0%80%EC%A7%80
### https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
### https://velog.io/@psk84/.gitignore-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0
### https://choiiis.github.io/git/how-to-commit-local-change/
### https://velog.io/@blair-lee/VSCode%EC%97%90%EC%84%9C-Github-%EC%97%85%EB%A1%9C%EB%93%9C%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95%EC%A7%B1%EC%89%AC%EC%9B%80%E3%85%8B%E3%85%8B#%EC%9E%A0%EA%B9%90-%F0%9F%A4%9A-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-%EC%A0%84%EC%97%90
### git command 정리 웹사이트
### https://devhealer.tistory.com/43

### 전체 사용자(global) 아이디/이메일 설정
### git config --global user.name "John Doe"
### git config --global user.email johndoe@example.com

### 로컬 사용자 아이디/이메일 설정
### git config user.name
### git config user.email

### 전체 사용자(global) 아이디/이메일 삭제
### git config --global --unset user.name
### git config --global --unset user.email

### 전체 사용자(global) 아이디/이메일 새로 설정하고 기존 사용자 정보 모두 교체(삭제)
### git config --global --replace-all user.name "Your New Name"
### git config --global --replace-all user.email "Your new email"

### 아이디/이메일 매뉴얼로 지우기
### git config --global --edit
### Press the Esc key to go to normal mode.
### Place the cursor on the line you want to delete.
### Type dd and hit Enter to remove the line.
### when you finish, type ESQ and :wq



### git reset 옵션 3가지
#### git reset --hard
#### git reset --mixed
#### git reset --soft
                    repository                  staging area                working directory
--hard  ->  HEAD가 주어진 커밋으로 이동     주어진 커밋으로 이동        주어진 커밋으로 이동
--mixed ->  HEAD가 주어진 커밋으로 이동     주어진 커밋으로 이동        변경 없음
--soft  ->  HEAD가 주어진 커밋으로 이동     변경 없음                   변경 없음

### git에서 refusing to merge unrelated histories 오류 뜰 때
git pull origin main --allow-unrelated-histories
서로 관련 없는 두 프로젝트를 강제로 병합할 때 사용

### 각종 명령어
#### vim 명령어
    - vim       -> vim 창으로 이동
    - i, o, a   -> 입력모드로 전환
    - ESC       -> 명령모드로 전환
    - :wq       -> 저장하고 vim 창 나가기
    - :q!       -> 저장안하고 vim 창 나가기
    - if : + enter  -> 다음 줄 출력
    - if : + space  -> 다음 페이지 출력

#### git 명령어
    git 명령어 (나열하는 모든 git 명령어 앞에 git이 붙어서 git은 생략 (입력 시에는 생략 불가!!!))
    - config list   -> C:\Users\user\.gitconfig 내용을 출력
    
    - log           -> 로컬저장소 기록을 출력
        - log --oneline -> 한줄로 로컬자장소 기록을 출력
        - log --oneline -all -> 로컬저장소 모든 기록을 한줄로 출력
        - log --oneline -graph -all -> 로컬저장소 모든 기록을 그래프로 한줄로 출력
    - status        -> 가장 최근에 원격저장소에 받아온 기록을 기준으로 로컬저장소 버전과 비교 상태 출력
    - commit -am "(메시지 입력)" -> git add + git commit -m 를 합친 명령어

    - checkout (해시번호 7글자) -> 해당 커밋으로 로컬저장소 HEAD를 이동
        - checkout main -> 메인 커밋으로 로컬저장소 HEAD를 이동 (최신 커밋으로 이동)
        - checkout HEAD^ -> 바로 이전 커밋으로 이동
        - checkout HEAD~n -> 현재 HEAD 기준으로 n 회차 이전 커밋으로 이동
    - switch main -> 위 명령어랑 동일
    - switch (브램치 이름) -> 해당 브랜치로 이동

    - restore --staged (파일명) -> 스테이징된 파일에 대해서 스테이징 취소
    - branch -> 현재 로컬저장소에 있는 브랜치 리스트 출력
        - branch (브랜치 이름) -> 새 브랜치 생성
        - branch (브랜치 이름) (브랜치 해시 7글자) -> 새 브랜치를 생성하고 해시번호에 해당하는 버전으로 초기화
        - branch -d (브랜치 이름) -> 해당 브랜치 삭제

    - branch -m (new-name) -> 현재 위치한 브랜치의 이름을 변경
    - branch -m (old-name) (new-name) -> 현재 브랜치에 상관 없이 브랜치 이름 변경
    - config --global init.defaultBranch main -> 기본 브랜치 이름을 메인으로 설정
    - init -b main -> 깃저장소로 초기화하고 브랜치 이름 main으로 지정

    - clone https://github.com/user-id/repository-id -> 새 폴더를 만들고 이 폴더 안에 원격저장소 내용물을 전부 복사함


#### git 명령어 (git 없이 씀)
    - > (파일명) -> 해당 파일 생성
    - echo "메시지" >> file-name -> 해당 텍스트를 가진 파일을 생성



### git 개념
    HEAD는 현재 git이 어떤 버전의 로컬저장소를 바라보고 있는지 나타내는 표현

    git 스냅샷 개념
        - git은 파일의 이름이나 위치가 아닌 내용물을 기반으로 생성한 해시코드로 파일을 추적한다.
        - 기존 파일의 이름과 저장 위치가 바뀌어도 내용물의 큰변화가 없을 시...
        -> git은 이동한 파일이 기존에 있던 파일의 수정버전인 걸 감지할 수 있다.
    
    git reset vs git revert
    reset은 돌아가려는 버전 이후로 버전을 모두 삭제
    revert는 현재 버전에서 돌아가려는 버전을 현재 버전의 다음 시점처럼 변경 

    git은 로컬저장소
    github는 원격저장소
    git != github

## Remote Repository Setup
### 로컬저장소를 생성하고 원격저장소로 푸시 하기
echo "# (repository-name)" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:(user-id)/(repository-name).git
git push -u origin main

### 기존에 있는 로컬저장소 내용을 원격저장소로 푸시하기
git remote add origin git@github.com:(user-id)/(repository-name).git
git branch -M main
git push -u origin main

### 로컬저장소를 원격저장소 기준으로 추적시키기
git branch --set-upstream-to=origin/main main
git branch -u origin/main
git branch -u origin/main main

main 원격저장소 url 잘못 설정했을 때 변경하는 법
git remote set-url origin https://github.com/user-id/repository-id.git
https://github.com/user-id/repository-id.git랑 git@github.com:(user-id)/(repository-name).git 동일

git remote -v
# View existing remotes
# origin  https://github.com/user/repo.git (fetch)
# origin  https://github.com/user/repo.git (push)

git remote -v
# Verify new remote URL
# origin  https://github.com/user/repo2.git (fetch)
# origin  https://github.com/user/repo2.git (push)


## How to convert gitignore.txt into .gitignore

## option 1
### 1. touch .gitignore

## option 2
### 1. Create the text file gitignore.txt
### 2. Open it in a text editor and add your rules, then save and close
### 3. Hold Shift, right click the folder you're in, and then select Open command window here
### 4. Then rename the file in the command line, with ren gitignore.txt .gitignore

## option 3
### 1. save the text file as .gitignore.

### SSH key 생성 및 GitHub에 연동하기

cd ~/.ssh/

ssh-keygen -t ed25519 -C "your_email@example.com"

cat ~/.ssh/id_ed25519.pub

Go to GitHub > Settings > SSH and GPG keys and click New SSH Key. Paste your public key there.

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

git remote add origin git@github.com:username/repo.git
