
_fkcTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(void){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int count = fkc(1);
   9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10:	e8 10 04 00 00       	call   425 <fkc>
  15:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  printf(1, "number of forks when program starts: %d\n", count);
  19:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1d:	89 44 24 08          	mov    %eax,0x8(%esp)
  21:	c7 44 24 04 dc 08 00 	movl   $0x8dc,0x4(%esp)
  28:	00 
  29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  30:	e8 d8 04 00 00       	call   50d <printf>

  //first two forks in the program
  if(fork() > 0){
  35:	e8 3b 03 00 00       	call   375 <fork>
  3a:	85 c0                	test   %eax,%eax
  3c:	0f 8e ce 00 00 00    	jle    110 <main+0x110>
  	if(fork() >0){
  42:	e8 2e 03 00 00       	call   375 <fork>
  47:	85 c0                	test   %eax,%eax
  49:	0f 8e c1 00 00 00    	jle    110 <main+0x110>
	
	//parent process
	count = fkc(1);
  4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  56:	e8 ca 03 00 00       	call   425 <fkc>
  5b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	printf(1, "number of forks after two more forks: %d\n", count);
  5f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  63:	89 44 24 08          	mov    %eax,0x8(%esp)
  67:	c7 44 24 04 08 09 00 	movl   $0x908,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  76:	e8 92 04 00 00       	call   50d <printf>

	//resetting counter
	fkc(0);
  7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  82:	e8 9e 03 00 00       	call   425 <fkc>
	printf(1, "number of forks after count cleared: %d\n", fkc(1));
  87:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8e:	e8 92 03 00 00       	call   425 <fkc>
  93:	89 44 24 08          	mov    %eax,0x8(%esp)
  97:	c7 44 24 04 34 09 00 	movl   $0x934,0x4(%esp)
  9e:	00 
  9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a6:	e8 62 04 00 00       	call   50d <printf>

	//three more forks
	if(fork() >0){
  ab:	e8 c5 02 00 00       	call   375 <fork>
  b0:	85 c0                	test   %eax,%eax
  b2:	7e 5c                	jle    110 <main+0x110>
	if(fork()>0){	
  b4:	e8 bc 02 00 00       	call   375 <fork>
  b9:	85 c0                	test   %eax,%eax
  bb:	7e 53                	jle    110 <main+0x110>
		if(fork()>0){
  bd:	e8 b3 02 00 00       	call   375 <fork>
  c2:	85 c0                	test   %eax,%eax
  c4:	7e 4a                	jle    110 <main+0x110>
			//parent process
			count = fkc(1);
  c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  cd:	e8 53 03 00 00       	call   425 <fkc>
  d2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
			printf(1, "number of forks after three more forks: %d\n", count);
  d6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  da:	89 44 24 08          	mov    %eax,0x8(%esp)
  de:	c7 44 24 04 60 09 00 	movl   $0x960,0x4(%esp)
  e5:	00 
  e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ed:	e8 1b 04 00 00       	call   50d <printf>
			
			//wait for childrens
			wait();
  f2:	e8 8e 02 00 00       	call   385 <wait>
			wait();
  f7:	e8 89 02 00 00       	call   385 <wait>
			wait();
  fc:	e8 84 02 00 00       	call   385 <wait>
			wait();
 101:	e8 7f 02 00 00       	call   385 <wait>
			wait();	
 106:	e8 7a 02 00 00       	call   385 <wait>
			wait();
 10b:	e8 75 02 00 00       	call   385 <wait>
			}
		      }
	            }
	        }
            }
	exit();
 110:	e8 68 02 00 00       	call   37d <exit>

00000115 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	57                   	push   %edi
 119:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 55 10             	mov    0x10(%ebp),%edx
 120:	8b 45 0c             	mov    0xc(%ebp),%eax
 123:	89 cb                	mov    %ecx,%ebx
 125:	89 df                	mov    %ebx,%edi
 127:	89 d1                	mov    %edx,%ecx
 129:	fc                   	cld    
 12a:	f3 aa                	rep stos %al,%es:(%edi)
 12c:	89 ca                	mov    %ecx,%edx
 12e:	89 fb                	mov    %edi,%ebx
 130:	89 5d 08             	mov    %ebx,0x8(%ebp)
 133:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 136:	5b                   	pop    %ebx
 137:	5f                   	pop    %edi
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 146:	90                   	nop
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	8d 50 01             	lea    0x1(%eax),%edx
 14d:	89 55 08             	mov    %edx,0x8(%ebp)
 150:	8b 55 0c             	mov    0xc(%ebp),%edx
 153:	8d 4a 01             	lea    0x1(%edx),%ecx
 156:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 159:	0f b6 12             	movzbl (%edx),%edx
 15c:	88 10                	mov    %dl,(%eax)
 15e:	0f b6 00             	movzbl (%eax),%eax
 161:	84 c0                	test   %al,%al
 163:	75 e2                	jne    147 <strcpy+0xd>
    ;
  return os;
 165:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 168:	c9                   	leave  
 169:	c3                   	ret    

0000016a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16d:	eb 08                	jmp    177 <strcmp+0xd>
    p++, q++;
 16f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 173:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	0f b6 00             	movzbl (%eax),%eax
 17d:	84 c0                	test   %al,%al
 17f:	74 10                	je     191 <strcmp+0x27>
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	8b 45 0c             	mov    0xc(%ebp),%eax
 18a:	0f b6 00             	movzbl (%eax),%eax
 18d:	38 c2                	cmp    %al,%dl
 18f:	74 de                	je     16f <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	0f b6 00             	movzbl (%eax),%eax
 197:	0f b6 d0             	movzbl %al,%edx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	0f b6 c0             	movzbl %al,%eax
 1a3:	29 c2                	sub    %eax,%edx
 1a5:	89 d0                	mov    %edx,%eax
}
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    

000001a9 <strlen>:

uint
strlen(const char *s)
{
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b6:	eb 04                	jmp    1bc <strlen+0x13>
 1b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	01 d0                	add    %edx,%eax
 1c4:	0f b6 00             	movzbl (%eax),%eax
 1c7:	84 c0                	test   %al,%al
 1c9:	75 ed                	jne    1b8 <strlen+0xf>
    ;
  return n;
 1cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1ce:	c9                   	leave  
 1cf:	c3                   	ret    

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d6:	8b 45 10             	mov    0x10(%ebp),%eax
 1d9:	89 44 24 08          	mov    %eax,0x8(%esp)
 1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	89 04 24             	mov    %eax,(%esp)
 1ea:	e8 26 ff ff ff       	call   115 <stosb>
  return dst;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <strchr>:

char*
strchr(const char *s, char c)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 04             	sub    $0x4,%esp
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 200:	eb 14                	jmp    216 <strchr+0x22>
    if(*s == c)
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	0f b6 00             	movzbl (%eax),%eax
 208:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20b:	75 05                	jne    212 <strchr+0x1e>
      return (char*)s;
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
 210:	eb 13                	jmp    225 <strchr+0x31>
  for(; *s; s++)
 212:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	0f b6 00             	movzbl (%eax),%eax
 21c:	84 c0                	test   %al,%al
 21e:	75 e2                	jne    202 <strchr+0xe>
  return 0;
 220:	b8 00 00 00 00       	mov    $0x0,%eax
}
 225:	c9                   	leave  
 226:	c3                   	ret    

00000227 <gets>:

char*
gets(char *buf, int max)
{
 227:	55                   	push   %ebp
 228:	89 e5                	mov    %esp,%ebp
 22a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 234:	eb 4c                	jmp    282 <gets+0x5b>
    cc = read(0, &c, 1);
 236:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23d:	00 
 23e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 241:	89 44 24 04          	mov    %eax,0x4(%esp)
 245:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24c:	e8 44 01 00 00       	call   395 <read>
 251:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 254:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 258:	7f 02                	jg     25c <gets+0x35>
      break;
 25a:	eb 31                	jmp    28d <gets+0x66>
    buf[i++] = c;
 25c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25f:	8d 50 01             	lea    0x1(%eax),%edx
 262:	89 55 f4             	mov    %edx,-0xc(%ebp)
 265:	89 c2                	mov    %eax,%edx
 267:	8b 45 08             	mov    0x8(%ebp),%eax
 26a:	01 c2                	add    %eax,%edx
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 272:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 276:	3c 0a                	cmp    $0xa,%al
 278:	74 13                	je     28d <gets+0x66>
 27a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27e:	3c 0d                	cmp    $0xd,%al
 280:	74 0b                	je     28d <gets+0x66>
  for(i=0; i+1 < max; ){
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	83 c0 01             	add    $0x1,%eax
 288:	3b 45 0c             	cmp    0xc(%ebp),%eax
 28b:	7c a9                	jl     236 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 28d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	01 d0                	add    %edx,%eax
 295:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29b:	c9                   	leave  
 29c:	c3                   	ret    

0000029d <stat>:

int
stat(const char *n, struct stat *st)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2aa:	00 
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	89 04 24             	mov    %eax,(%esp)
 2b1:	e8 07 01 00 00       	call   3bd <open>
 2b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2bd:	79 07                	jns    2c6 <stat+0x29>
    return -1;
 2bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c4:	eb 23                	jmp    2e9 <stat+0x4c>
  r = fstat(fd, st);
 2c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d0:	89 04 24             	mov    %eax,(%esp)
 2d3:	e8 fd 00 00 00       	call   3d5 <fstat>
 2d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2de:	89 04 24             	mov    %eax,(%esp)
 2e1:	e8 bf 00 00 00       	call   3a5 <close>
  return r;
 2e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <atoi>:

int
atoi(const char *s)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f8:	eb 25                	jmp    31f <atoi+0x34>
    n = n*10 + *s++ - '0';
 2fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fd:	89 d0                	mov    %edx,%eax
 2ff:	c1 e0 02             	shl    $0x2,%eax
 302:	01 d0                	add    %edx,%eax
 304:	01 c0                	add    %eax,%eax
 306:	89 c1                	mov    %eax,%ecx
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	8d 50 01             	lea    0x1(%eax),%edx
 30e:	89 55 08             	mov    %edx,0x8(%ebp)
 311:	0f b6 00             	movzbl (%eax),%eax
 314:	0f be c0             	movsbl %al,%eax
 317:	01 c8                	add    %ecx,%eax
 319:	83 e8 30             	sub    $0x30,%eax
 31c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	0f b6 00             	movzbl (%eax),%eax
 325:	3c 2f                	cmp    $0x2f,%al
 327:	7e 0a                	jle    333 <atoi+0x48>
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	0f b6 00             	movzbl (%eax),%eax
 32f:	3c 39                	cmp    $0x39,%al
 331:	7e c7                	jle    2fa <atoi+0xf>
  return n;
 333:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 336:	c9                   	leave  
 337:	c3                   	ret    

00000338 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 33e:	8b 45 08             	mov    0x8(%ebp),%eax
 341:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 344:	8b 45 0c             	mov    0xc(%ebp),%eax
 347:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 34a:	eb 17                	jmp    363 <memmove+0x2b>
    *dst++ = *src++;
 34c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34f:	8d 50 01             	lea    0x1(%eax),%edx
 352:	89 55 fc             	mov    %edx,-0x4(%ebp)
 355:	8b 55 f8             	mov    -0x8(%ebp),%edx
 358:	8d 4a 01             	lea    0x1(%edx),%ecx
 35b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 35e:	0f b6 12             	movzbl (%edx),%edx
 361:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 363:	8b 45 10             	mov    0x10(%ebp),%eax
 366:	8d 50 ff             	lea    -0x1(%eax),%edx
 369:	89 55 10             	mov    %edx,0x10(%ebp)
 36c:	85 c0                	test   %eax,%eax
 36e:	7f dc                	jg     34c <memmove+0x14>
  return vdst;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
}
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 375:	b8 01 00 00 00       	mov    $0x1,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <exit>:
SYSCALL(exit)
 37d:	b8 02 00 00 00       	mov    $0x2,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <wait>:
SYSCALL(wait)
 385:	b8 03 00 00 00       	mov    $0x3,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <pipe>:
SYSCALL(pipe)
 38d:	b8 04 00 00 00       	mov    $0x4,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <read>:
SYSCALL(read)
 395:	b8 05 00 00 00       	mov    $0x5,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <write>:
SYSCALL(write)
 39d:	b8 10 00 00 00       	mov    $0x10,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <close>:
SYSCALL(close)
 3a5:	b8 15 00 00 00       	mov    $0x15,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <kill>:
SYSCALL(kill)
 3ad:	b8 06 00 00 00       	mov    $0x6,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <exec>:
SYSCALL(exec)
 3b5:	b8 07 00 00 00       	mov    $0x7,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <open>:
SYSCALL(open)
 3bd:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <mknod>:
SYSCALL(mknod)
 3c5:	b8 11 00 00 00       	mov    $0x11,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <unlink>:
SYSCALL(unlink)
 3cd:	b8 12 00 00 00       	mov    $0x12,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <fstat>:
SYSCALL(fstat)
 3d5:	b8 08 00 00 00       	mov    $0x8,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <link>:
SYSCALL(link)
 3dd:	b8 13 00 00 00       	mov    $0x13,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <mkdir>:
SYSCALL(mkdir)
 3e5:	b8 14 00 00 00       	mov    $0x14,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <chdir>:
SYSCALL(chdir)
 3ed:	b8 09 00 00 00       	mov    $0x9,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <dup>:
SYSCALL(dup)
 3f5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <getpid>:
SYSCALL(getpid)
 3fd:	b8 0b 00 00 00       	mov    $0xb,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <sbrk>:
SYSCALL(sbrk)
 405:	b8 0c 00 00 00       	mov    $0xc,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <sleep>:
SYSCALL(sleep)
 40d:	b8 0d 00 00 00       	mov    $0xd,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <uptime>:
SYSCALL(uptime)
 415:	b8 0e 00 00 00       	mov    $0xe,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <hw>:
SYSCALL(hw)
 41d:	b8 16 00 00 00       	mov    $0x16,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <fkc>:
SYSCALL(fkc)
 425:	b8 17 00 00 00       	mov    $0x17,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	83 ec 18             	sub    $0x18,%esp
 433:	8b 45 0c             	mov    0xc(%ebp),%eax
 436:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 439:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 440:	00 
 441:	8d 45 f4             	lea    -0xc(%ebp),%eax
 444:	89 44 24 04          	mov    %eax,0x4(%esp)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 4a ff ff ff       	call   39d <write>
}
 453:	c9                   	leave  
 454:	c3                   	ret    

00000455 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	56                   	push   %esi
 459:	53                   	push   %ebx
 45a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 45d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 464:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 468:	74 17                	je     481 <printint+0x2c>
 46a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 46e:	79 11                	jns    481 <printint+0x2c>
    neg = 1;
 470:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 477:	8b 45 0c             	mov    0xc(%ebp),%eax
 47a:	f7 d8                	neg    %eax
 47c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 47f:	eb 06                	jmp    487 <printint+0x32>
  } else {
    x = xx;
 481:	8b 45 0c             	mov    0xc(%ebp),%eax
 484:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 487:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 48e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 491:	8d 41 01             	lea    0x1(%ecx),%eax
 494:	89 45 f4             	mov    %eax,-0xc(%ebp)
 497:	8b 5d 10             	mov    0x10(%ebp),%ebx
 49a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49d:	ba 00 00 00 00       	mov    $0x0,%edx
 4a2:	f7 f3                	div    %ebx
 4a4:	89 d0                	mov    %edx,%eax
 4a6:	0f b6 80 d8 0b 00 00 	movzbl 0xbd8(%eax),%eax
 4ad:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4b1:	8b 75 10             	mov    0x10(%ebp),%esi
 4b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b7:	ba 00 00 00 00       	mov    $0x0,%edx
 4bc:	f7 f6                	div    %esi
 4be:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c5:	75 c7                	jne    48e <printint+0x39>
  if(neg)
 4c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4cb:	74 10                	je     4dd <printint+0x88>
    buf[i++] = '-';
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	8d 50 01             	lea    0x1(%eax),%edx
 4d3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4d6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4db:	eb 1f                	jmp    4fc <printint+0xa7>
 4dd:	eb 1d                	jmp    4fc <printint+0xa7>
    putc(fd, buf[i]);
 4df:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e5:	01 d0                	add    %edx,%eax
 4e7:	0f b6 00             	movzbl (%eax),%eax
 4ea:	0f be c0             	movsbl %al,%eax
 4ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 31 ff ff ff       	call   42d <putc>
  while(--i >= 0)
 4fc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 500:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 504:	79 d9                	jns    4df <printint+0x8a>
}
 506:	83 c4 30             	add    $0x30,%esp
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    

0000050d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 50d:	55                   	push   %ebp
 50e:	89 e5                	mov    %esp,%ebp
 510:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 513:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 51a:	8d 45 0c             	lea    0xc(%ebp),%eax
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 523:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 52a:	e9 7c 01 00 00       	jmp    6ab <printf+0x19e>
    c = fmt[i] & 0xff;
 52f:	8b 55 0c             	mov    0xc(%ebp),%edx
 532:	8b 45 f0             	mov    -0x10(%ebp),%eax
 535:	01 d0                	add    %edx,%eax
 537:	0f b6 00             	movzbl (%eax),%eax
 53a:	0f be c0             	movsbl %al,%eax
 53d:	25 ff 00 00 00       	and    $0xff,%eax
 542:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 545:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 549:	75 2c                	jne    577 <printf+0x6a>
      if(c == '%'){
 54b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 54f:	75 0c                	jne    55d <printf+0x50>
        state = '%';
 551:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 558:	e9 4a 01 00 00       	jmp    6a7 <printf+0x19a>
      } else {
        putc(fd, c);
 55d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 560:	0f be c0             	movsbl %al,%eax
 563:	89 44 24 04          	mov    %eax,0x4(%esp)
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	89 04 24             	mov    %eax,(%esp)
 56d:	e8 bb fe ff ff       	call   42d <putc>
 572:	e9 30 01 00 00       	jmp    6a7 <printf+0x19a>
      }
    } else if(state == '%'){
 577:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 57b:	0f 85 26 01 00 00    	jne    6a7 <printf+0x19a>
      if(c == 'd'){
 581:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 585:	75 2d                	jne    5b4 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 587:	8b 45 e8             	mov    -0x18(%ebp),%eax
 58a:	8b 00                	mov    (%eax),%eax
 58c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 593:	00 
 594:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 59b:	00 
 59c:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	89 04 24             	mov    %eax,(%esp)
 5a6:	e8 aa fe ff ff       	call   455 <printint>
        ap++;
 5ab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5af:	e9 ec 00 00 00       	jmp    6a0 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5b4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5b8:	74 06                	je     5c0 <printf+0xb3>
 5ba:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5be:	75 2d                	jne    5ed <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c3:	8b 00                	mov    (%eax),%eax
 5c5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5cc:	00 
 5cd:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5d4:	00 
 5d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	89 04 24             	mov    %eax,(%esp)
 5df:	e8 71 fe ff ff       	call   455 <printint>
        ap++;
 5e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e8:	e9 b3 00 00 00       	jmp    6a0 <printf+0x193>
      } else if(c == 's'){
 5ed:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5f1:	75 45                	jne    638 <printf+0x12b>
        s = (char*)*ap;
 5f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f6:	8b 00                	mov    (%eax),%eax
 5f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5fb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 603:	75 09                	jne    60e <printf+0x101>
          s = "(null)";
 605:	c7 45 f4 8c 09 00 00 	movl   $0x98c,-0xc(%ebp)
        while(*s != 0){
 60c:	eb 1e                	jmp    62c <printf+0x11f>
 60e:	eb 1c                	jmp    62c <printf+0x11f>
          putc(fd, *s);
 610:	8b 45 f4             	mov    -0xc(%ebp),%eax
 613:	0f b6 00             	movzbl (%eax),%eax
 616:	0f be c0             	movsbl %al,%eax
 619:	89 44 24 04          	mov    %eax,0x4(%esp)
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	89 04 24             	mov    %eax,(%esp)
 623:	e8 05 fe ff ff       	call   42d <putc>
          s++;
 628:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 62c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62f:	0f b6 00             	movzbl (%eax),%eax
 632:	84 c0                	test   %al,%al
 634:	75 da                	jne    610 <printf+0x103>
 636:	eb 68                	jmp    6a0 <printf+0x193>
        }
      } else if(c == 'c'){
 638:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 63c:	75 1d                	jne    65b <printf+0x14e>
        putc(fd, *ap);
 63e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 641:	8b 00                	mov    (%eax),%eax
 643:	0f be c0             	movsbl %al,%eax
 646:	89 44 24 04          	mov    %eax,0x4(%esp)
 64a:	8b 45 08             	mov    0x8(%ebp),%eax
 64d:	89 04 24             	mov    %eax,(%esp)
 650:	e8 d8 fd ff ff       	call   42d <putc>
        ap++;
 655:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 659:	eb 45                	jmp    6a0 <printf+0x193>
      } else if(c == '%'){
 65b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 65f:	75 17                	jne    678 <printf+0x16b>
        putc(fd, c);
 661:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 664:	0f be c0             	movsbl %al,%eax
 667:	89 44 24 04          	mov    %eax,0x4(%esp)
 66b:	8b 45 08             	mov    0x8(%ebp),%eax
 66e:	89 04 24             	mov    %eax,(%esp)
 671:	e8 b7 fd ff ff       	call   42d <putc>
 676:	eb 28                	jmp    6a0 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 678:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 67f:	00 
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	89 04 24             	mov    %eax,(%esp)
 686:	e8 a2 fd ff ff       	call   42d <putc>
        putc(fd, c);
 68b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68e:	0f be c0             	movsbl %al,%eax
 691:	89 44 24 04          	mov    %eax,0x4(%esp)
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	89 04 24             	mov    %eax,(%esp)
 69b:	e8 8d fd ff ff       	call   42d <putc>
      }
      state = 0;
 6a0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6a7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b1:	01 d0                	add    %edx,%eax
 6b3:	0f b6 00             	movzbl (%eax),%eax
 6b6:	84 c0                	test   %al,%al
 6b8:	0f 85 71 fe ff ff    	jne    52f <printf+0x22>
    }
  }
}
 6be:	c9                   	leave  
 6bf:	c3                   	ret    

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c6:	8b 45 08             	mov    0x8(%ebp),%eax
 6c9:	83 e8 08             	sub    $0x8,%eax
 6cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6cf:	a1 f4 0b 00 00       	mov    0xbf4,%eax
 6d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d7:	eb 24                	jmp    6fd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 00                	mov    (%eax),%eax
 6de:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e1:	77 12                	ja     6f5 <free+0x35>
 6e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e9:	77 24                	ja     70f <free+0x4f>
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ee:	8b 00                	mov    (%eax),%eax
 6f0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f3:	77 1a                	ja     70f <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	8b 00                	mov    (%eax),%eax
 6fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 700:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 703:	76 d4                	jbe    6d9 <free+0x19>
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	8b 00                	mov    (%eax),%eax
 70a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70d:	76 ca                	jbe    6d9 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 70f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 712:	8b 40 04             	mov    0x4(%eax),%eax
 715:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71f:	01 c2                	add    %eax,%edx
 721:	8b 45 fc             	mov    -0x4(%ebp),%eax
 724:	8b 00                	mov    (%eax),%eax
 726:	39 c2                	cmp    %eax,%edx
 728:	75 24                	jne    74e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 00                	mov    (%eax),%eax
 735:	8b 40 04             	mov    0x4(%eax),%eax
 738:	01 c2                	add    %eax,%edx
 73a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	8b 10                	mov    (%eax),%edx
 747:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74a:	89 10                	mov    %edx,(%eax)
 74c:	eb 0a                	jmp    758 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 10                	mov    (%eax),%edx
 753:	8b 45 f8             	mov    -0x8(%ebp),%eax
 756:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 758:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75b:	8b 40 04             	mov    0x4(%eax),%eax
 75e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	01 d0                	add    %edx,%eax
 76a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76d:	75 20                	jne    78f <free+0xcf>
    p->s.size += bp->s.size;
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 50 04             	mov    0x4(%eax),%edx
 775:	8b 45 f8             	mov    -0x8(%ebp),%eax
 778:	8b 40 04             	mov    0x4(%eax),%eax
 77b:	01 c2                	add    %eax,%edx
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	8b 10                	mov    (%eax),%edx
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	89 10                	mov    %edx,(%eax)
 78d:	eb 08                	jmp    797 <free+0xd7>
  } else
    p->s.ptr = bp;
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 55 f8             	mov    -0x8(%ebp),%edx
 795:	89 10                	mov    %edx,(%eax)
  freep = p;
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	a3 f4 0b 00 00       	mov    %eax,0xbf4
}
 79f:	c9                   	leave  
 7a0:	c3                   	ret    

000007a1 <morecore>:

static Header*
morecore(uint nu)
{
 7a1:	55                   	push   %ebp
 7a2:	89 e5                	mov    %esp,%ebp
 7a4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7ae:	77 07                	ja     7b7 <morecore+0x16>
    nu = 4096;
 7b0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ba:	c1 e0 03             	shl    $0x3,%eax
 7bd:	89 04 24             	mov    %eax,(%esp)
 7c0:	e8 40 fc ff ff       	call   405 <sbrk>
 7c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7c8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7cc:	75 07                	jne    7d5 <morecore+0x34>
    return 0;
 7ce:	b8 00 00 00 00       	mov    $0x0,%eax
 7d3:	eb 22                	jmp    7f7 <morecore+0x56>
  hp = (Header*)p;
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7de:	8b 55 08             	mov    0x8(%ebp),%edx
 7e1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e7:	83 c0 08             	add    $0x8,%eax
 7ea:	89 04 24             	mov    %eax,(%esp)
 7ed:	e8 ce fe ff ff       	call   6c0 <free>
  return freep;
 7f2:	a1 f4 0b 00 00       	mov    0xbf4,%eax
}
 7f7:	c9                   	leave  
 7f8:	c3                   	ret    

000007f9 <malloc>:

void*
malloc(uint nbytes)
{
 7f9:	55                   	push   %ebp
 7fa:	89 e5                	mov    %esp,%ebp
 7fc:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ff:	8b 45 08             	mov    0x8(%ebp),%eax
 802:	83 c0 07             	add    $0x7,%eax
 805:	c1 e8 03             	shr    $0x3,%eax
 808:	83 c0 01             	add    $0x1,%eax
 80b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 80e:	a1 f4 0b 00 00       	mov    0xbf4,%eax
 813:	89 45 f0             	mov    %eax,-0x10(%ebp)
 816:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 81a:	75 23                	jne    83f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 81c:	c7 45 f0 ec 0b 00 00 	movl   $0xbec,-0x10(%ebp)
 823:	8b 45 f0             	mov    -0x10(%ebp),%eax
 826:	a3 f4 0b 00 00       	mov    %eax,0xbf4
 82b:	a1 f4 0b 00 00       	mov    0xbf4,%eax
 830:	a3 ec 0b 00 00       	mov    %eax,0xbec
    base.s.size = 0;
 835:	c7 05 f0 0b 00 00 00 	movl   $0x0,0xbf0
 83c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 842:	8b 00                	mov    (%eax),%eax
 844:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 847:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84a:	8b 40 04             	mov    0x4(%eax),%eax
 84d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 850:	72 4d                	jb     89f <malloc+0xa6>
      if(p->s.size == nunits)
 852:	8b 45 f4             	mov    -0xc(%ebp),%eax
 855:	8b 40 04             	mov    0x4(%eax),%eax
 858:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85b:	75 0c                	jne    869 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 10                	mov    (%eax),%edx
 862:	8b 45 f0             	mov    -0x10(%ebp),%eax
 865:	89 10                	mov    %edx,(%eax)
 867:	eb 26                	jmp    88f <malloc+0x96>
      else {
        p->s.size -= nunits;
 869:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86c:	8b 40 04             	mov    0x4(%eax),%eax
 86f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 872:	89 c2                	mov    %eax,%edx
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 87a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87d:	8b 40 04             	mov    0x4(%eax),%eax
 880:	c1 e0 03             	shl    $0x3,%eax
 883:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 886:	8b 45 f4             	mov    -0xc(%ebp),%eax
 889:	8b 55 ec             	mov    -0x14(%ebp),%edx
 88c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	a3 f4 0b 00 00       	mov    %eax,0xbf4
      return (void*)(p + 1);
 897:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89a:	83 c0 08             	add    $0x8,%eax
 89d:	eb 38                	jmp    8d7 <malloc+0xde>
    }
    if(p == freep)
 89f:	a1 f4 0b 00 00       	mov    0xbf4,%eax
 8a4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8a7:	75 1b                	jne    8c4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 ed fe ff ff       	call   7a1 <morecore>
 8b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8bb:	75 07                	jne    8c4 <malloc+0xcb>
        return 0;
 8bd:	b8 00 00 00 00       	mov    $0x0,%eax
 8c2:	eb 13                	jmp    8d7 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cd:	8b 00                	mov    (%eax),%eax
 8cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8d2:	e9 70 ff ff ff       	jmp    847 <malloc+0x4e>
}
 8d7:	c9                   	leave  
 8d8:	c3                   	ret    
